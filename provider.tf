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
