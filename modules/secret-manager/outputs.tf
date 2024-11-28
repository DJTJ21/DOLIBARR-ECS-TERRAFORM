output "db_password_arn" {
  description = "Secrets Manager ARN for the MySQL password"
  value       = aws_secretsmanager_secret.db_password.arn
}

output "admin_password_arn" {
  description = "Secrets Manager ARN for the Dolibarr admin password"
  value       = aws_secretsmanager_secret.dolibarr_admin_password.arn
}
