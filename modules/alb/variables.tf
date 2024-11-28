
variable "lb_security_group_id" {
  description = "ID du Security Group pour le Load Balancer"
  type        = string
}

variable "public_subnets" {
  description = "Liste des sous-réseaux publics"
  type        = list(string)
}

variable "acm_certificate_arn" {
  description = "ARN du certificat SSL/TLS ACM"
  type        = string
}


variable "target_group_name" {
  description = "Nom du groupe cible"
  type        = string
}

variable "target_group_port" {
  description = "Port du groupe cible"
  type        = number
  default     = 80
}

variable "vpc_id" {
  description = "ID du VPC"
  type        = string
}

variable "enable_deletion_protection" {
  description = "Activer la protection contre la suppression du Load Balancer"
  type        = bool
  default     = false
}

variable "default_tags" {
  description = "Tags par défaut à appliquer aux ressources"
  type        = map(string)
  default     = {}
}
