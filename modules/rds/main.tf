# Generate a secure random password
resource "random_password" "rds_password" {
  length  = 16
  special = false
}

# Store the username in AWS Systems Manager Parameter Store
resource "aws_ssm_parameter" "rds_username" {
  name  = "/rds/username"
  type  = "String"
  value = var.db_username
}

# Store the password in AWS Systems Manager Parameter Store (SecureString)
resource "aws_ssm_parameter" "rds_password" {
  name  = "/rds/password"
  type  = "SecureString"
  value = random_password.rds_password.result
}

# Create the RDS instance
resource "aws_db_instance" "my_rds" {
  engine                 = var.db_engine
  engine_version         = var.db_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  username               = aws_ssm_parameter.rds_username.value
  password               = aws_ssm_parameter.rds_password.value
  publicly_accessible    = false
  skip_final_snapshot    = true
  storage_encrypted      = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}

# Security Group for RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow database access"

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
