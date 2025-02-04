module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name            = "secure-vpc"
  cidr            = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnets  = ["10.0.1.0/24"]
  private_subnets = ["10.0.2.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  
  tags = {
    Environment = "dev"
    Project     = "IaC Security"
  }
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name          = "secure-instance"
  instance_type = "t3.micro"
  ami          = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (example)
  subnet_id    = module.vpc.public_subnets[0]
  key_name     = "my-key"
  
  security_groups = [module.security_group.security_group_id]

  tags = {
    Environment = "dev"
  }
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.0.0"

  name        = "secure-sg"
  description = "Allow only SSH and HTTP"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  
  egress_rules = ["all-all"]
}

module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.2.0"

  bucket = "secure-iac-bucket"
  acl    = "private"
  versioning = {
    enabled = true
  }
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.0.0"

  identifier = "secure-db"
  engine     = "mysql"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  username   = "admin"
  password   = "securepassword123"
  publicly_accessible = false
  subnet_ids = module.vpc.private_subnets
  vpc_security_group_ids = [module.security_group.security_group_id]
  
  tags = {
    Environment = "dev"
  }
}