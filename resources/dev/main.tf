module "vpc" {
  source = "git::https://github.com/fallou77/my-terraform-repo.git//modules/vpc"
  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  availability_zone_1  = var.availability_zone_1
  availability_zone_2  = var.availability_zone_2
  region               = var.region
}

module "sg" {
  source = "git::https://github.com/fallou77/my-terraform-repo.git//modules/sg"
  sg_name        = var.sg_name
  sg_description = var.sg_description
  vpc_id         = module.vpc.vpc_id
  ingress_rules  = var.ingress_rules
  region      = var.region
}

module "ec2" {
  source = "git::https://github.com/fallou77/my-terraform-repo.git//modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = module.vpc.public_subnet_1_id
  security_group_id         = module.sg.sg_id
  instance_name = var.instance_name
  region             = var.region
}

module "s3" {
  source      = "git::https://github.com/fallou77/my-terraform-repo.git//modules/s3"
  bucket_name = var.bucket_name
  region      = var.region
}

