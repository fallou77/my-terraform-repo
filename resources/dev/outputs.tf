output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_1_id" {
  value = module.vpc.public_subnet_1_id
}

output "public_subnet_2_id" {
  value = module.vpc.public_subnet_2_id
}

output "security_group_id" {
  value = module.sg.security_group_id
}

output "ec2_instance_id" {
  value = module.ec2.ec2_instance_id
}

output "ec2_public_ip" {
  value = module.ec2.ec2_public_ip
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}
