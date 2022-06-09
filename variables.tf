variable "instance_count" {
       description = "Number of instances to create."
       default     = 2
}

variable "aws_region" {
       description = "The AWS region to create things in." 
       default     = "eu-north-1" 
}

variable "key_name" { 
    description = " SSH keys to connect to ec2 instance" 
    default     =  "new-key" 
}

variable "instance_type" { 
    description = "instance type for ec2" 
    default     =  "t3.micro" 
}

variable "ami_id" { 
    description = "AMI for Amazon Linux 2 EC2 instance" 
    default     = "ami-08bdc08970fcbd34a" 
}
