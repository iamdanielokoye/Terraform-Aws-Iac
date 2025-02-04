# Policy 1: Enforce S3 Bucket Encryption
policy "enforce-s3-encryption" {
  enforcement_level = "hard-mandatory"
}

# Policy 2: Restrict EC2 Instance Types
policy "restrict-ec2-instance-types" {
  enforcement_level = "soft-mandatory"
}

# Policy 3: Require RDS Automated Backups
policy "require-rds-backups" {
  enforcement_level = "hard-mandatory"
}

# Import the Terraform plan
import "tfplan"

# Rule 1: Ensure all S3 buckets have encryption enabled
main = rule {
  all tfplan.resources.aws_s3_bucket as _, buckets {
    all buckets as bucket {
      bucket.applied.server_side_encryption_configuration is not null
    }
  }
}

# Rule 2: Restrict EC2 instance types to allowed list
main = rule {
  allowed_instance_types = ["t2.micro", "t3.micro"]
  all tfplan.resources.aws_instance as _, instances {
    all instances as instance {
      instance.applied.instance_type in allowed_instance_types
    }
  }
}

# Rule 3: Ensure RDS instances have automated backups enabled
main = rule {
  all tfplan.resources.aws_db_instance as _, instances {
    all instances as instance {
      instance.applied.backup_retention_period > 0
    }
  }
}