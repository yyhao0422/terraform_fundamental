#Input Variaables
#AWS Region
variable "aws_region" {
    description = "Region in  which AWS Resources to be created"
    type = string
    default = "us-east-1"
    
}

# AWS EC2 Instance Type
variable "instance_type" {
    description = "EC2 Instance type"
    type = string
    default = "t2.micro"
    
  
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
    description = "AWS EC2 Key Pair that need to be asspcoated with EC2 Instance"
    type = string
    default = "terraform-user"
    
}

#AWS EC2 Instance Type - List

variable "instance_type_list" {
  description = "EC2 Instance Type"
  type = list(string)
  default = [ "t2.micro","t2.small" ]
}

#AWS EC2 Instance Type - MAP

variable "instance_type_map" {
  description = "EC2 Instance type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa" = "t2.small"
    "Prod" = "t2.large"
  }

}    