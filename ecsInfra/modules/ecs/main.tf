data "aws_iam_role" "existing_ecs_execution_role" {
  name = var.existing_execution_role_name
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-cluster"
  tags = merge(
    var.mandatory_tags,
    var.optional_tags
  )
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "ecs-task-family"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = data.aws_iam_role.existing_ecs_execution_role.arn
  container_definitions    = var.container_definitions
  tags = merge(
    var.mandatory_tags,
    var.optional_tags
  )
}

resource "aws_ecs_service" "ecs_service" {
  name            = "ecs-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [var.ecs_security_group_id]
  }
  tags = merge(
    var.mandatory_tags,
    var.optional_tags
  )
}
