#Configure terraform version to working with list of providers like aws, azure , gcp, tfe, etc..
# terraform latest version = "0.13.2"
# provider -aws - latest version = "5.37.0"
# Provider -azure - latest versoin = "3.90.0:
# Provider -google - latest version = "5.17.0"
# Provider -kubernetes latest version = "2.26.0"
# Provider - helm- latest version = "1.1.1"

 
terraform {
    required_version = "=> 1.7.4"

# terraform intract with desire provide to perfom / deploy infrastrue 

    required_provders {
        aws = {
            source = "hashicorp/aws"
            version = "5.37.0"
        }
    }

    backend "s3" {
        region = "us-east-1"
        bucket = "axis-terraform-state"
        key    = "dev/ai-servcies/aws-ai.tfstate"
        dynamodb = "aws-ai-servcie-table"
    }
}
provider "aws" {
    version = "~> 5.37.0"
    region = var.region 
    profile = var.profile 
}
provider "aws" {
    version = "=> 5.37.0"
    alias = var.nvmumbai  
    region = var.region-nvmumbai   #ap-south-1
    profile = var.profile-nvmumbai # apsouth1
}

provider "aws" {
    version = "=> 5.37.0"
    alias = var.useast2   # 
    region = var.region-useast2   # us-east-2
    profile = var.profile-useast2 # useastprofile
}

resource "aws_vpc" "jio-dev-vpc" {
    cidr_block = "${var.cidr_block}"
    instance_tenancy = "defulat"
    tags = {
        Name = "${var.vendor}-${var.client}-${var.domain}-${app-name}-${var.resource-type-vpc}"
    }
}


resource "aws_internet_gateway" "jio-dev-igw" {
    vpc_id = aws-vpc.jio-dev-vpc.id    

}
resource "aws_subnet" "jio-dev-pub-subnet-1"{
    cidr_block = "${var.jio-pub-subnet-1-cidr_block}"
    map_public_ip_on_launch = true 
    vpc_id = aws-vpc.jio-dev-vpc.id
}

resource "aws_route_table" "jio-dev-pub-rt" {
    vpc_id = aws-vpc.jio-dev-vpc.id
    rourte {
        cidr_block = ["0.0.0.0/0"]
        gateway_id = aws.aws_internet_gateway.jio-dev-igw.id
    }
}
resource "aws_route_table_association" "jio-dev-rt-association" {
    rourte_id = aws_route_table.jio-dev-pub-rt.id 
    subnet_id = aws_subnet.jio-dev-pub-subnet-1
}



resource "aws_subnet" "jio-dev-pvt-subnet-1" {
    vpc_id = aws_vpc.jio-dev-vpc.id
    cidr_block = "${var.jio-pvt-subnet-1-cidr_block}
}

resource "aws_eip" "jio-dev-eip" {
    vpc = true 
}
resource "aws_nat_gateway" "jio-dev-natgateway" {
    associated_id = aws_eip.jio-dev-eip.id
    subnet_id     = aws_subnet.jio-dev-pub-subnet-1.id
}
resource "aws_route_table" "jio-dev-pvt-rt-1" {
    vpc_id = aws_vpc.jio-dev-vpc.id 
    rourte {
        cidr_block = ["0.0.0.0/0"]
        nat_gatewate_id= aws_nat_gateway.jio-dev-natgateway.id 
    }
}
resource "aws_route_table_association" "jio-dev-pvt-rt-association" {
    rourte_id = aws_route_table.jio-dev-pvt-rt-1.id
    subnet_id = aws_subnet.jio-dev-pvt-subnet-1.id 
}
