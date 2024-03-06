terraform {
    backend "s3" {
        bucket = ""
        key = ""
        region = "us-east-1"
    }
    required_providers {
      aws = {
        source = "hashicorp/aws",
        version = "~> 5.0"
      }
    }
}

# Configure aws provider
provider "aws" {
  region = "us-east-1"
}

module "dev_infra" {
  source = "../../blueprint"
}