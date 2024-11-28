output "ecs_task_execution_role_arn" {
  description = "ARN of the ECS task execution role"
  value       = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_execution_role_arn" {
  description = "ARN du rôle d'exécution pour ECS"
  value       = aws_iam_role.ecs_execution_role.arn
}
