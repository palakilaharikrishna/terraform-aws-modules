####################################################################
#  Region  -- Primary Region - secondary Region -- Failover Regions
####################################################################

variable "region" {
    description = "default region us"
}

variable "profile" {
    description = "default profile for us"
}

variable "nvmumbai" {
    description = "secondary region for india "
}


variable "nvmumbai" {
    description = "secondary region for india "
}

variable "region-nvmumbai" {
    description = "secondary region for india "
}

variable "profile-nvmumbai" {
    description = "secondary region for india "
}


variable "useast2" {
    description = "secondary region for india "
}

variable "region-useast2" {
    description = "secondary region for india "
}

variable "profile-useast2" {
    description = "secondary region for india "
}

########################################################################################
#  VPC  -- CIDR Block and Pub / Pvt Subnets 
########################################################################################

variable "cidr_block" {
    description = "dev vpc cidr block"
}

variable "jio-pub-subnet-1-cidr_block" {
    description = "single public subnet"
}

variable "jio-pvt-subnet-1-cidr_block" {
    description = "single public subnet"
}


######################################################################################
#   Resource Naming Convention
######################################################################################

variable "vendor" {
    description = "arcgis vendor "
}

variable "client" {
    description = "dbs"
}

variable "domain" {
    description = "dbs bank "
}

variable "app-name" {
    description = "pgi- Payment Gateway Application"
}

variable "resource-type-igw" {
    description = "DBS - Bank Internew Gateway"
}

variable "resource-type-pub-subnet" {
    description = "dev pub subnet"
}

variable "resource-type-pub-rt" {
    description = "dev pub route table"
}



variable "resource-type-pvt-subnet" {
    description = "dev pvt subnet "
}

variable "resource-type-pvt-rt" {
    description = "dev pvt route table"
}














