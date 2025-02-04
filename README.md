# Infrastructure-as-Code (IaC) with Terraform

## Overview
This project demonstrates Infrastructure-as-Code (IaC) using **Terraform** to provision a **secure AWS infrastructure**. The infrastructure includes a **VPC, EC2 instance, RDS database, S3 bucket, and security groups** with compliance and security best practices.

## Features
- **Modular Terraform Code**: Reusable Terraform modules for provisioning AWS resources.
- **Secure Infrastructure**:
  - **VPC** with public and private subnets.
  - **EC2 instance** with restricted security group access.
  - **RDS Database** with private subnet placement and automated backups.
  - **S3 Bucket** with versioning enabled.
- **Security Best Practices**:
  - Security group rules to restrict access.
  - Compliance checks using **Terraform Sentinel**.
- **CI/CD Integration**:
  - GitHub Actions pipeline for Terraform linting, validation, security scanning, and deployment.

## Project Structure
```
/terraform-aws-iac
├── providers.tf          # AWS provider configuration
├── variables.tf          # Input variables
├── main.tf               # Main Terraform configuration
├── outputs.tf            # Output values
├── modules/
│   ├── vpc/              # VPC module 
│   ├── ec2/              # EC2 module
│   ├── rds/              # RDS module
│   ├── s3/               # S3 module 
├── .github/workflows/
│   ├── terraform.yml     # CI/CD pipeline for Terraform
│   ├── sentinel.hcl      # Terraform Sentinel policies for compliance
```

## Prerequisites
- **Terraform** (>= 1.0.0) installed
- **AWS CLI** configured with appropriate credentials
- **GitHub Actions** enabled (for CI/CD pipeline execution)

## Usage
### 1️⃣ Clone the Repository
```bash
git clone https://github.com/yourusername/terraform-aws-iac.git
cd terraform-aws-iac
```

### 2️⃣ Initialize Terraform
```bash
terraform init
```

### 3️⃣ Validate & Plan
```bash
terraform validate
terraform plan
```

### 4️⃣ Apply the Configuration
```bash
terraform apply -auto-approve
```

### 5️⃣ Destroy the Infrastructure (if needed)
```bash
terraform destroy -auto-approve
```

## CI/CD Pipeline
The GitHub Actions workflow automates Terraform deployment with:
1. **Linting & Validation**: Runs `terraform fmt` and `terraform validate`.
2. **Security Scans**: Uses **Terraform Sentinel** for compliance checks.
3. **Terraform Plan & Apply**: Requires manual approval for `apply` in the `main` branch.

## Future Enhancements
- Add **Terraform State Management** using **S3 + DynamoDB**.
- Implement **AWS IAM Role-based Access Controls (RBAC)**.
- Expand Sentinel policies for advanced compliance checks.

## License
This project is licensed under the MIT License.

---
**Author**: Your Name  
**GitHub**: [yourusername](https://github.com/yourusername)  
**Email**: your.email@example.com

