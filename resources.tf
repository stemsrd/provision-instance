resource "aws_instance" "unbound" {
      ami           = var.ami_id

      key_name = var.key_name
      instance_type = var.instance_type
      security_groups= [ "unbound_security_group"]
      tags= {
        Name = "unbound_instance"
      }
    }

 resource "aws_security_group" "unbound_security_group" {
      name        = "unbound_security_group"
      description = "security group for unbound"

     ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

      tags= {
        Name = "security_unbound"
      }
    }

# Create Elastic IP address for unbound instance
resource "aws_eip" "unbound" {
  vpc      = true
  instance = aws_instance.unbound.id
tags= {
    Name = "unbound_elastic_ip"
  }
}
