# S11 Terraform Infrastructure

Terraform infrastructure for AWS resources including VPC, EC2, S3, and Security Groups.

## Repository Structure

```
s11-terraform/
├── ec2-s3/                     # Standalone EC2 and S3 configuration (legacy)
│   ├── ec2.tf
│   ├── s3.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── modules/                    # Reusable Terraform modules
│   ├── vpc/                    # VPC module with 2 public subnets
│   │   ├── vpc.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── provider.tf
│   │
│   ├── sg/                     # Security Group module
│   │   ├── sg.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── provider.tf
│   │
│   ├── ec2/                    # EC2 instance module
│   │   ├── ec2.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── provider.tf
│   │
│   └── s3/                     # S3 bucket module
│       ├── s3.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── provider.tf
│
└── resources/                  # Environment-specific configurations
    ├── dev/                    # Development environment
    │   ├── main.tf
    │   ├── provider.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── terraform.tfvars
    │
    ├── prod/                   # Production environment
    │   ├── main.tf
    │   ├── provider.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── terraform.tfvars
    │
    └── sandbox/                # Sandbox environment
        ├── ec2/
        └── s3/
```

## Modules

### VPC Module
Creates a VPC with:
- Configurable CIDR block
- 2 public subnets in different availability zones
- Internet Gateway
- Route table with public route

### Security Group Module
Creates a security group with:
- Configurable ingress rules
- Default egress to allow all outbound traffic

### EC2 Module
Creates an EC2 instance with:
- Configurable AMI, instance type, key pair
- Placement in specified subnet and security group

### S3 Module
Creates an S3 bucket with configurable name.

## Usage

### Initialize and apply for dev environment

```bash
cd resources/dev
terraform init
terraform plan
terraform apply
```

### Initialize and apply for prod environment

```bash
cd resources/prod
terraform init
terraform plan
terraform apply
```

## Configuration

Update the `terraform.tfvars` file in each environment directory with your specific values:

- `region` - AWS region
- `vpc_name` - Name for the VPC
- `vpc_cidr` - CIDR block for VPC
- `public_subnet_1_cidr` / `public_subnet_2_cidr` - Subnet CIDR blocks
- `availability_zone_1` / `availability_zone_2` - AWS availability zones
- `sg_name` - Security group name
- `ingress_rules` - List of ingress rules for security group
- `ami_id` - AMI ID for EC2 instance
- `instance_type` - EC2 instance type
- `key_name` - SSH key pair name
- `instance_name` - Name tag for EC2 instance
- `bucket_name` - S3 bucket name
