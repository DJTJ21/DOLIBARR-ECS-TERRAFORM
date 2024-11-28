output "dolibarr_service_id" {
  description = "ARN of the Dolibarr ECS service"
  value       = aws_ecs_service.dolibarr_service.id
}

output "dolibarr_task_definition_arn" {
  description = "ARN of the Dolibarr ECS task definition"
  value       = aws_ecs_task_definition.dolibarr_task.arn
}
