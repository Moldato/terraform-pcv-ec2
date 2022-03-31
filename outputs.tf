data "aws_caller_identity" "current" {}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.api.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.api.public_ip
}

output "instance_aplication_url" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.api.public_dns
}

output "account_id" {
  description = "Show Account ID"
  value       = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  description = "Show ARN Account ID"
  value       = data.aws_caller_identity.current.arn
}

output "caller_user" {
  description = "Show User ID"
  value       = data.aws_caller_identity.current.user_id
}