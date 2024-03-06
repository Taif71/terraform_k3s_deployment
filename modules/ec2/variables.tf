variable "public_subnet_id" {
  description = "This id is for public subnet"
}

variable "private_subnet_id" {
  description = "This id is for private subnet"
}

variable "security_group_id" {
  description = "This is a security group ID"
}

variable "number_of_public_vm" {}

variable "number_of_private_vm" {}

variable "instance_type_public" {}

variable "instance_type_private" {}

variable "ami" {}