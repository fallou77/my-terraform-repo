# General
region = "us-east-1"

# VPC
vpc_name             = "dev-vpc"
vpc_cidr             = "10.0.0.0/16"
public_subnet_1_cidr = "10.0.1.0/24"
public_subnet_2_cidr = "10.0.2.0/24"
availability_zone_1  = "us-east-1a"
availability_zone_2  = "us-east-1b"

# Security Group
sg_name = "dev-sg"
ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# EC2
ami_id        = "ami-0b6c6ebed2801a5cb"
instance_type = "t3.micro"
key_name      = "demo-key"
instance_name = "dev-instance"

# S3
bucket_name = "s11-dev-bucket"