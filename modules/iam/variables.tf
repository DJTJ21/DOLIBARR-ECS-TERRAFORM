variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket for Dolibarr documents"
  type        = string
}

variable "secrets_arn" {
  description = "ARN of the Secrets Manager secret"
  type        = string
}

variable "default_tags" {
  description = "Default tags for resources"
  type        = map(string)
  default     = {}
}

variable "additional_policy_resources" {
  description = "Liste des ressources additionnelles pour des politiques personnalisées (e.g., ARN de Secrets Manager, SSM)"
  type        = list(string)
  default     = []
}