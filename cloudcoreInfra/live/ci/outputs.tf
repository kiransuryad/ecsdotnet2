output "ci_vpc_id" {
  value = module.vpc.vpc_id
}

output "ci_private_subnet_1_id" {
  value = module.vpc.private_subnet_1_id
}

output "ci_private_subnet_2_id" {
  value = module.vpc.private_subnet_2_id
}

output "ci_security_group_id" {
  value = module.vpc.security_group_id
}

# VPC Endpoints
output "ci_s3_vpc_endpoint_id" {
  value = module.vpc_endpoints.s3_vpc_endpoint_id
}

/* output "ci_dynamodb_vpc_endpoint_id" {
  value = module.vpc_endpoints.dynamodb_vpc_endpoint_id
} */
/* 
output "ci_ecs_vpc_endpoint_id" {
  value = module.vpc_endpoints.ecs_vpc_endpoint_id
} */

output "ci_ecr_dkr_vpc_endpoint_id" {
  value = module.vpc_endpoints.ecr_dkr_vpc_endpoint_id
}

output "ci_ecr_repository_url" {
  value = module.ecr.ecr_repository_url
}

output "ci_ecs_security_group_id" {
  value = module.security_groups.ecs_security_group_id
}

output "ci_alb_security_group_id" {
  value = module.security_groups.alb_security_group_id
}

output "ci_ecr_api_vpc_endpoint_id" {
  value = module.vpc_endpoints.ecr_api_vpc_endpoint_id
}
