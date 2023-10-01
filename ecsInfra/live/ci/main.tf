provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "my-terraform-state-098887211"
    key    = "ci-app/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ecs" {
  source                       = "../../modules/ecs"
  vpc_id                       = var.vpc_id
  private_subnet_ids           = var.private_subnet_ids
  ecs_security_group_id        = var.ecs_security_group_id
  alb_security_group_id        = var.alb_security_group_id
  desired_count                = var.desired_count
  existing_execution_role_name = var.existing_execution_role_name
  ecr_repository_url           = var.ecr_repository_url
  cpu                          = var.cpu
  memory                       = var.memory
  container_definitions        = var.container_definitions
  mandatory_tags               = var.mandatory_tags
  optional_tags                = var.optional_tags
}
