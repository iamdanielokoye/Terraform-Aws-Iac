# Example update in your Terraform configuration (modules/s3/main.tf)
resource "aws_s3_bucket" "example" {
  bucket = var.s3_bucket
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.example.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}