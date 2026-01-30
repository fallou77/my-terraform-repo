#######################################################
# VPC Module
#######################################################
module "vpc" {
  source = "github.com/fallou77/s11-terraform//modules/vpc"

  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  availability_zone_1  = var.availability_zone_1
  availability_zone_2  = var.availability_zone_2
  region               = var.region
}

#######################################################
# Security Group Module
#######################################################
module "sg" {
  source = "github.com/fallou77/s11-terraform//modules/sg"

  sg_name        = var.sg_name
  sg_description = var.sg_description
  vpc_id         = module.vpc.vpc_id
  ingress_rules  = var.ingress_rules
}

#######################################################
# EC2 Module
#######################################################
module "ec2" {
  source = "github.com/fallou77/s11-terraform//modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = module.vpc.public_subnet_1_id
  sg_id         = module.sg.sg_id
  instance_name = var.instance_name
}

#######################################################
# S3 Module
#######################################################
module "s3" {
  source      = "github.com/fallou77/s11-terraform//modules/s3"
  bucket_name = var.bucket_name
}

#######################################################
# Outputs
#######################################################
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "sg_id" {
  value = module.sg.sg_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

