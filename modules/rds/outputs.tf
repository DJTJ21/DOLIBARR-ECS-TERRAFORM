output "db_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.mysql.endpoint
}

output "db_host" {
  description = "RDS database host"
  value       = aws_db_instance.mysql.address
}

output "db_port" {
  description = "RDS database port"
  value       = aws_db_instance.mysql.port
}
