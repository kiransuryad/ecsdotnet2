{
  "vpc_id": "vpc-0bd3ad0959b69db41",
  "private_subnet_ids": ["subnet-049c5c5a77b1ff30f", "subnet-0e37925c9e902a612"],
  "ecs_security_group_id": "sg-05798a433fe63e6b0",
  "alb_security_group_id": "sg-0ed2120666d7f59ab",
  "ci_security_group_id": "sg-0398e87510baaccc2",
  "ecr_repository_url": "739870437205.dkr.ecr.us-east-1.amazonaws.com/my-dotnet-app",
  "cpu": "512",
  "memory": "1024",
  "desired_count": 3,
  "existing_execution_role_name": "ecs_execution_role",
    "container_definitions": "[{\"name\": \"my-container\", \"image\": \"739870437205.dkr.ecr.us-east-1.amazonaws.com/my-dotnet-app:0.0.6\", \"portMappings\": [{\"containerPort\": 80, \"hostPort\": 80}], \"logConfiguration\": {\"logDriver\": \"awslogs\", \"options\": {\"awslogs-group\": \"my-log-group\", \"awslogs-region\": \"us-east-1\", \"awslogs-stream-prefix\": \"ecs\"}}}, {\"name\": \"debug-sidecar\", \"image\": \"739870437205.dkr.ecr.us-east-1.amazonaws.com/debug-sidecar:0.0.2\", \"healthCheck\": {\"command\": [\"CMD-SHELL\", \"curl --fail http://localhost:80/ || exit 1\"], \"interval\": 30, \"timeout\": 5, \"startPeriod\": 120, \"retries\": 6}, \"logConfiguration\": {\"logDriver\": \"awslogs\", \"options\": {\"awslogs-group\": \"my-sidecar-log-group\", \"awslogs-region\": \"us-east-1\", \"awslogs-stream-prefix\": \"ecs\"}}}]"
  ,
  "mandatory_tags": {
    "Environment": "CI",
    "ManagedBy": "Terraform"
  },
  "optional_tags": {
    "Project": "MyProject"
  }
}
