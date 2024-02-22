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


module "aws-dbs-bank-dev-vpc" {
    region                         = "${var.mregion}"
    profile                        = "${var.mprofile}"
    nvmumbai                       = "${var.mnvmumbai}"
    region-nvmumbai                = "${var.mregion-nvmumbai}"
    profile-nvmumbai               = "${var.mprofile-nvmumbai}"
    useast2                        = "${var.museast2}"
    region-useast2                 = "${var.mregion-useast2}"
    profile-useast2                =  "${var.mregion-useast2}"
    vendor                         = "${var.mvendor}"
    client                         = "${var.mclient}"
    domain                         = "${var.mdomain}"
    env                            =  "${var.menv}"
    app-name                       = "${var.mapp-name}"
    resource-type-vpc              = "${var.mresource-type-vpc}"
    resource-type-igw              =  "${var.mresource-type-igw}"
    resource-type-pub-subnet       = "${var.mresource-type-subnet}"
    resource-type-pub-rt           = "${var.mresource-type-pub-rt}"
    resource-type-pvt-subnet       = "${var.mresource-type-pvt-subnet}"
    resource-type-pvt-rt           = "${var.mresource-type-pvt-rg}"
    cidr_block                     = "${var.mcidr_block}"
    jio-pub-subnet-1-cidr_block    = "${var.mjio-pub-subnet-1-cidr_block}"
    jio-pvt-subnet-1-cidr_block    =  "${var.mjio-pvt-subnet-1-cidr_block}"

}