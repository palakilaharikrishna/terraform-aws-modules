####################################################################
#  Region  -- Primary Region - secondary Region -- Failover Regions
####################################################################

variable "region" {
    default = "us-east-1"
    type    = string
    description = "default region us"
}

variable "profile" {
    default = "usprofile"
    type    = string 
    description = "default profile for us"
}

variable "nvmumbai" {
    default = "ap-south-1"
    type    = string 
    description = "secondary region for india "
}


variable "nvmumbai" {
    default = "nvmumbai"
    type    = string 
    description = "secondary region for india "
}

variable "region-nvmumbai" {
    default = "ap-south-1"
    type    = string 
    description = "secondary region for india "
}

variable "profile-nvmumbai" {
    default = "nvmumbai-profile"
    type    = string 
    description = "secondary region for india "
}


variable "useast2" {
    default = "useast2"
    type    = string 
    description = "secondary region for india "
}

variable "region-useast2" {
    default = "us-east-2"
    type    = string 
    description = "secondary region for india "
}

variable "profile-useast2" {
    default = "useast2-profile"
    type    = string 
    description = "secondary region for india "
}

########################################################################################
#  VPC  -- CIDR Block and Pub / Pvt Subnets 
########################################################################################

variable "cidr_block" {
    default = ["192.168.0.0/16"]
}

variable "jio-pub-subnet-1-cidr_block" {
    default = ["192.168.1.0/24"]
    type    = string
    description = "single public subnet"
}

variable "jio-pvt-subnet-1-cidr_block" {
    default = ["192.168.2.0/24"]
    type    = string
    description = "single public subnet"
}


######################################################################################
#   Resource Naming Convention
######################################################################################

variable "vendor" {
    type = string 
    default = "arcgis"
    description = "arcgis vendor "
}

variable "client" {
    type = string 
    default = "dbs"
    description = "dbs"
}

variable "domain" {
    type = string 
    default = "dbs-bank"
    description = "dbs bank "
}

variable "app-name" {
    type = string 
    default = "pgi-application"
    description = "pgi- Payment Gateway Application"
}

variable "resource-type-igw" {
    type = string
    default = "dbs-igw"
    description = "DBS - Bank Internew Gateway"
}

variable "resource-type-pub-subnet" {
    type = string 
    default = "jio-dev-pub-subnet-1"
}

variable "resource-type-pub-rt" {
    type = string
    default = "jio-dev-pub-rt"
}



variable "resource-type-pvt-subnet" {
    type = string 
    default = "jio-dev-pvt-subnet-1"
}

variable "resource-type-pvt-rt" {
    type = string
    default = "jio-dev-pvt-rt"
}














