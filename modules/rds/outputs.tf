output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.my_rds.endpoint
}

output "rds_security_group_id" {
  description = "Security group ID for the RDS instance"
  value       = aws_security_group.rds_sg.id
}

output "rds_ssm_username_param" {
  description = "SSM Parameter Store path for RDS username"
  value       = aws_ssm_parameter.rds_username.name
}

output "rds_ssm_password_param" {
  description = "SSM Parameter Store path for RDS password"
  value       = aws_ssm_parameter.rds_password.name
}
