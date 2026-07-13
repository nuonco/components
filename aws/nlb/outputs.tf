output "lb_arn" {
  value       = aws_lb.sandbox_preview.arn
  description = "ARN of the sandbox-preview NLB."
}

output "lb_dns_name" {
  value       = aws_lb.sandbox_preview.dns_name
  description = "Public DNS name of the sandbox-preview NLB (target for the *.sandbox.<domain> record)."
}

output "lb_zone_id" {
  value       = aws_lb.sandbox_preview.zone_id
  description = "Hosted-zone ID of the NLB, for a Route53 alias record."
}

output "target_group_arn" {
  value       = aws_lb_target_group.sandbox_preview.arn
  description = "ARN of the NodePort target group."
}
