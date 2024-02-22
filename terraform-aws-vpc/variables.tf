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


variable "cidr_block" {
    default = ["192.168.0.0/16"]
}

variable "jio-pub-subnet-1-cidr_block" {
    default = ["192.168.1.0/24"]
    type    = string
    description = "single public subnet"
}


variable "cidr_block_pvt" {
    default = ["192.168.2.0/24"]
    type    = string
    description = "single public subnet"
}
