locals {
  common_tags                = merge(var.mandatory_tags, var.optional_tags)
  interface_endpoints_sg_ids = [var.ecs_security_group_id, var.alb_security_group_id]
}

# S3 Gateway Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [var.route_table_id]
  tags              = local.common_tags
}

/* # DynamoDB Gateway Endpoint
resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.dynamodb"
  vpc_endpoint_type = "Gateway"
  tags              = local.common_tags
} */

# Interface Endpoints
resource "aws_vpc_endpoint" "interface_endpoints" {
  for_each            = toset(["ecr.dkr", "ecr.api", "logs"])
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.${each.value}"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids = [
    for subnet in slice(var.private_subnet_ids, 0, length(var.private_subnet_ids) > 1 ? 2 : 1) : subnet
  ]

  #security_group_ids = concat(var.common_security_group_ids, [var.endpoint_security_group_id])
  security_group_ids = [var.endpoint_security_group_id]
  tags               = local.common_tags
}
