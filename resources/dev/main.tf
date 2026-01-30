#######################################################
# VPC Module
#######################################################
module "vpc" {
  source = "../../modules/vpc"  # LOCAL PATH

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
  source = "../../modules/sg"   # LOCAL PATH

  sg_name        = var.sg_name
  sg_description = var.sg_description
  vpc_id         = module.vpc.vpc_id
  ingress_rules  = var.ingress_rules
}

#######################################################
# EC2 Module
#######################################################
module "ec2" {
  source = "../../modules/ec2"  # LOCAL PATH

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
  source      = "../../modules/s3"  # LOCAL PATH
  bucket_name = var.bucket_name
}

