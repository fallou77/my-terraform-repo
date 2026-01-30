variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.small"
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "bucket_name" {
  type = string
}
