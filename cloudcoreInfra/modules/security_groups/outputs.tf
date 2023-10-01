output "ecs_security_group_id" {
  value = aws_security_group.ecs_sg.id
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}

output "endpoint_security_group_id" {
  value = aws_security_group.endpoint_sg.id
}
