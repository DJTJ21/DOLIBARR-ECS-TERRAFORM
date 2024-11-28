output "lb_arn" {
  description = "ARN du Load Balancer"
  value       = aws_lb.this.arn
}

output "lb_dns_name" {
  description = "Nom DNS du Load Balancer"
  value       = aws_lb.this.dns_name
}

output "lb_listener_http_arn" {
  description = "ARN du Listener HTTP"
  value       = aws_lb_listener.http.arn
}

output "lb_listener_https_arn" {
  description = "ARN du Listener HTTPS"
  value       = aws_lb_listener.https.arn
}

output "target_group_arn" {
  description = "ARN du groupe cible"
  value       = aws_lb_target_group.default.arn
}
