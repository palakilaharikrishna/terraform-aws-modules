# Main.tf file --- This file used by terraform to Build the infrastrue and Change infrastrue & replicate infrastrue with high level service providers on multiple virtual datacenters

#Configure terraform version to working with list of providers like aws, azure , gcp, tfe, etc..
# terraform latest version = "0.13.2"
# provider -aws - latest version = "5.37.0"
# Provider -azure - latest versoin = "3.90.0:
# Provider -google - latest version = "5.17.0"
# Provider -kubernetes latest version = "2.26.0"
# Provider - helm- latest version = "1.1.1"
terraform {

# terraform intract with desire provide to perfom / deploy infrastrue 

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 2.13.0"
        }
    }

#    backend "s3" {
#        region = "us-east-1"
#        bucket = "axis-terraform-state"
#        key    = "dev/ai-servcies/aws-ai.tfstate"
#        dynamodb = "aws-ai-servcie-table"
#    }
}

provider "aws" {
    region = "us-east-1"

}
#provider "aws" {
#    region = var.region 
#    #profile = var.profile 
#}
#provider "aws" {
##    alias = "nvmumbai"
#   region = var.region-nvmumbai   #ap-south-1
#    #profile = var.profile-nvmumbai # apsouth1
#}



#provider "aws" {
#    alias = "useast2"   # 
#    region = var.region-useast2   # us-east-2
#    #profile = var.profile-useast2 # useastprofile
#}

 
resource "aws_vpc" "jio-dev-vpc" {
    cidr_block = "${var.cidr_block}"
    instance_tenancy = "default"
    #tags = {
    #    Name = "${var.vendor}-${var.client}-${var.domain}-${var.env}-${app-name}-${var.resource-type-vpc}"
    #}
}


resource "aws_internet_gateway" "jio-dev-igw" {
    vpc_id = aws_vpc.jio-dev-vpc.id
    #tags = {
    #    Name = "${var.vendor}-${var.client}-${var.domain}-${var.env}-${app-name}-${var.resource-type-igw}"
    #}    

}
resource "aws_subnet" "jio-dev-pub-subnet-1"{
    cidr_block = "${var.jio-pub-subnet-1-cidr_block}"
    map_public_ip_on_launch = true 
    vpc_id = aws_vpc.jio-dev-vpc.id
    ##tags = {
    #    Name = "${var.vendor}-${var.client}-${var.domain}-${var.env}-${app-name}-${var.resource-type-pub-subnet}"
    #}
}

resource "aws_route_table" "jio-dev-pub-rt" {
    vpc_id = aws_vpc.jio-dev-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.jio-dev-igw.id
    }
    #tags = {
    #    Name = "${var.vendor}-${var.client}-${var.domain}-${var.env}-${app-name}-${var.resource-type-pub-rt}"
    #}
}
resource "aws_route_table_association" "jio-dev-rt-association" {
    route_table_id = aws_route_table.jio-dev-pub-rt.id 
    subnet_id = aws_subnet.jio-dev-pub-subnet-1
}



resource "aws_subnet" "jio-dev-pvt-subnet-1" {
    vpc_id = aws_vpc.jio-dev-vpc.id
    cidr_block = "${var.jio-pvt-subnet-1-cidr_block}"
    ##tags = {
     #   Name = "${var.vendor}-${var.client}-${var.domain}-${var.env}-${app-name}-${var.resource-type-pvt-subnet}"
    #}
}

resource "aws_eip" "jio-dev-eip" {
    vpc = true 
}
resource "aws_nat_gateway" "jio-dev-natgateway" {
    allocation_id = aws_eip.jio-dev-eip.id
    subnet_id     = aws_subnet.jio-dev-pub-subnet-1.id
}
resource "aws_route_table" "jio-dev-pvt-rt-1" {
    vpc_id = aws_vpc.jio-dev-vpc.id 
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id= aws_nat_gateway.jio-dev-natgateway.id 
    }
    #tags = {
    ##    Name = "${var.vendor}-${var.client}-${var.domain}-${var.env}-${app-name}-${var.resource-type-pvt-rt}"
    #}
}
resource "aws_route_table_association" "jio-dev-pvt-rt-association" {
    route_table_id = aws_route_table.jio-dev-pvt-rt-1.id
    subnet_id = aws_subnet.jio-dev-pvt-subnet-1.id 
}
