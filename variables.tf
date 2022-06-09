variable "aws_region" {
       description = "The AWS region to create things in." 
       default     = "eu-north-1" 
}

variable "instance_count" {
       description = "Number of instances to create."
       default     = 2
}

variable "key_name" { 
    description = " SSH keys to connect to ec2 instance" 
    default     =  "new-key" 
}

variable "instance_type" { 
    description = "instance type for ec2" 
    default     =  "t3.micro" 
}

#variable "security_group" { 
#    description = "Name of security group" 
#    default     = "jenkins-sgroup-dec-2021" 
#}

#variable "tag_name" { 
#    description = "Tag Name of for Ec2 instance" 
#    default     = "my-ec2-instance" 
#} 

variable "ami_id" { 
    description = "AMI for Amazon Linux 2 EC2 instance" 
    default     = "ami-08bdc08970fcbd34a" 
}

#variable "versioning" {
#    type        = bool
#    description = "(Optional) A state of versioning."
#    default     = true
#}

#variable "acl" {
#    type        = string
#    description = " Defaults to private "
#    default     = "private"
#}


#variable "tags" {
#    type        = map
#    description = "(Optional) A mapping of tags to assign to the bucket."
#    default     = {
#        environment = "DEV"
#        terraform   = "true"
#    }
#}
