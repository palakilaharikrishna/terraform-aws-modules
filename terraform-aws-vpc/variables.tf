####################################################################
#  Region  -- Primary Region - secondary Region -- Failover Regions
####################################################################

#variable "mregion" {
#    description = "default region us"
#}

#variable "mprofile" {
#    description = "default profile for us"
#}

##variable "mnvmumbai" {
#    description = "secondary region for india "
#}


#variable "mnvmumbai" {
#    description = "secondary region for india "
#}

#variable "mregion-nvmumbai" {
#    description = "secondary region for india "
#}

#variable "mprofile-nvmumbai" {
#    description = "secondary region for india "
#}


#variable "museast2" {
#    description = "secondary region for india "
#}

#variable "mregion-useast2" {
#    description = "secondary region for india "
#}

#variable "mprofile-useast2" {
#    description = "secondary region for india "
#}

########################################################################################
#  VPC  -- CIDR Block and Pub / Pvt Subnets 
########################################################################################

variable "mcidr_block" {
    description = "dev vpc cidr block"
}

variable "mjio-pub-subnet-1-cidr_block" {
    description = "single public subnet"
}

variable "mjio-pvt-subnet-1-cidr_block" {
    description = "single public subnet"
}


######################################################################################
#   Resource Naming Convention
######################################################################################

#variable "mvendor" {
#    description = "arcgis vendor "
#}

#variable "mclient" {
#    description = "dbs"
#}

#variable "mdomain" {
#    description = "dbs bank "
#}
#variable "menv" {
#    description = "env details "
#}

#variable "mapp-name" {
##    description = "pgi- Payment Gateway Application"
#}


#variable "mresource-type-vpc" {
#    description = "DBS - Bank vpc"
#}


variable "mresource-type-igw" {
    description = "DBS - Bank Internew Gateway"
}

variable "mresource-type-pub-subnet" {
    description = "dev pub subnet"
}

variable "mresource-type-pub-rt" {
    description = "dev pub route table"
}



variable "mresource-type-pvt-subnet" {
    description = "dev pvt subnet "
}

variable "mresource-type-pvt-rt" {
    description = "dev pvt route table"
}














