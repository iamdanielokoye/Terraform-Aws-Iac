resource "aws_db_instance" "example" {
  identifier           = var.db_name
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  allocated_storage    = 20
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.example.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "example" {
  name       = "example-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "rds" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}