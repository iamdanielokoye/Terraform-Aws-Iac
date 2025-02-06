variable "db_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the RDS security group"
  type        = string
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t2.micro"

}

variable "allocated_storage" {
  description = "The allocated storage for the RDS instance"
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "The database engine for the RDS instance"
  type        = string
  default     = "mysql"
}

variable "db_version" {
  description = "The database engine version for the RDS instance"
  type        = string
  default     = "5.7"
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

variable "ec2_instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "db_port" {
  description = "Port for the RDS database"
  type        = number
  default     = 3306
}

variable "allowed_ips" {
  description = "List of allowed IP addresses for the RDS security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}