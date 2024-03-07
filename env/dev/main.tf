# terraform {
#   backend "s3" {
#     bucket = ""
#     key    = ""
#     region = "us-east-1"
#   }
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws",
#       version = "~> 5.0"
#     }
#   }
# }

terraform {
  cloud {
    organization = "k3s_org"

    workspaces {
      name = "k3s_automation_prod"
    }
  }
}

# Configure aws provider
provider "aws" {
  region     = "us-east-1"
  access_key = "" // or you can set this up in terraform cloud in variables section
  secret_key = ""
}

module "dev_infra" {
  source                = "../../blueprint"
  vpc_cidr              = "10.10.0.0/16"
  vpc_name              = "test-vpc"
  public_subnet_name    = "test-public-subnet"
  public_subnet_cidr    = "10.10.1.0/24"
  private_subnet_name   = "test-private-subnet"
  private_subnet_cidr   = "10.10.2.0/24"
  instance_type_public  = "t2.micro"
  instance_type_private = "t2.medium"
  number_of_public_vm   = 2
  number_of_private_vm  = 3
  gw_cidr               = "0.0.0.0/0"
  gw_tags               = "poridhi"
  ami                   = "ami-0c7217cdde317cfec"
}
