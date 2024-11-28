variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}



variable "db_password" {
  description = "Password for MySQL database"
  type        = string
}

variable "dolibarr_admin_password" {
  description = "Admin password for Dolibarr"
  type        = string
}
