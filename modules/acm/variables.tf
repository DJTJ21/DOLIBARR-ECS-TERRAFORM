variable "domain_name" {
  description = "Nom de domaine principal pour le certificat SSL"
  type        = string
}

variable "subject_alternative_names" {
  description = "Liste des noms alternatifs pour le certificat"
  type        = list(string)
  default     = []
}

variable "hosted_zone_id" {
  description = "ID de la zone hébergée Route 53"
  type        = string
}

variable "default_tags" {
  description = "Tags par défaut à appliquer aux ressources"
  type        = map(string)
  default     = {}
}
