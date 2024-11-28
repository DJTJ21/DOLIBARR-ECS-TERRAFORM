resource "aws_secretsmanager_secret" "db_password" {
  name        = "${var.environment}/mysql/new1_db_pass"
  description = "Password for the MySQL RDS instance"
  tags = {
    Environment = var.environment
    Name        = "MySQLPassword"
  }
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id = aws_secretsmanager_secret.db_password.id
  secret_string = var.db_password
}

resource "aws_secretsmanager_secret" "dolibarr_admin_password" {
  name        = "${var.environment}/dolibarr/new1_admin_pass"
  description = "Admin password for Dolibarr"
  tags = {
    Environment = var.environment
    Name        = "DolibarrAdminPassword"
  }
}

resource "aws_secretsmanager_secret_version" "dolibarr_admin_password" {
  secret_id = aws_secretsmanager_secret.dolibarr_admin_password.id
  secret_string = var.dolibarr_admin_password
}
