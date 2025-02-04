variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "azs" {
  description = "Availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0c02fb55956c7d316"
}

variable "ec2_instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "rds_db_name" {
  description = "Name of the RDS database"
  default     = "mydatabase"
}

variable "rds_db_username" {
  description = "Username for the RDS database"
  default     = "admin"
}

variable "rds_db_password" {
  description = "Password for the RDS database"
  sensitive   = true
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  default     = "my-secure-bucket"
}