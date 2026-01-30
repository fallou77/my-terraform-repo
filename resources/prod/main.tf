module "ec2" {
  source = "../../modules/ec2"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = var.subnet_id
  security_group_id = var.security_group_id
  instance_name     = "prod-instance"
  region            = var.region
}

module "s3" {
  source = "../../modules/s3"

  bucket_name = var.bucket_name
  region      = var.region
}
