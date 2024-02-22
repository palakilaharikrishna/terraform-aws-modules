terraform {
    required_version = "=> 1.7.4"

# terraform intract with desire provide to perfom / deploy infrastrue 

    required_provders {
        aws = {
            source = "hashicorp/aws"
            version = "5.37.0"
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