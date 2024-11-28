resource "aws_db_instance" "mysql" {
  identifier              = "${var.environment}-mysql-db"
  engine                  = "mysql"
  engine_version          = var.mysql_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  max_allocated_storage   = var.max_allocated_storage
  storage_type            = var.storage_type
  multi_az                = var.multi_az
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.mysql.name
  vpc_security_group_ids  = ["${var.security_group_ids}"]
  username                = var.username
  password                = var.db_password
  db_name                 = var.db_name

  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = true
  deletion_protection     = var.deletion_protection

 # monitoring_interval     = 60
 # performance_insights_enabled = true
 # performance_insights_kms_key_id = var.kms_key_id

  tags = {
    Environment = var.environment
    Name        = "${var.environment}-mysql"
  }
}

resource "aws_db_subnet_group" "mysql" {
  name       = "${var.environment}-mysql-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Environment = var.environment
    Name        = "${var.environment}-mysql-subnet-group"
  }
}
