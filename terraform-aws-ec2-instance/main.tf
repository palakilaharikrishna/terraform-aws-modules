#provide "aws" {
#    region = local.region
#}

#locals {
#    region = "ap-south-1"
#}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-south-1"
}

data "aws_availability_zones" "available" {}

resource "aws_instance" "nvmumbai_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = "t2.micro"

  tags = {
    Name = "nvmumbai-server"
  }
}