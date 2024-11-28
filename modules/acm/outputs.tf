output "certificate_arn" {
  description = "ARN du certificat SSL généré"
  value       = aws_acm_certificate.this.arn
}

output "validation_status" {
  description = "Statut de validation du certificat ACM"
  value       = aws_acm_certificate.this.status
}
