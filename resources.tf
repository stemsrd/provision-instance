resource "aws_instance" "unbound" {
      count = var.instance_count
      ami           = var.ami_id

      key_name = var.key_name
      instance_type = var.instance_type
      security_groups= [ "unbound_security_group"]
      tags= {
        Name = "unbound_instance-${count.index+1}"
      }

# call ansible to setup instance
      provisioner "remote-exec" {
        inline = ["echo hello"]
      }
      connection {
        host        = coalesce(self.public_ip, self.private_ip)
        type        = "ssh"
        user        = "ec2-user"
        private_key = file(pathexpand("/var/lib/jenkins/secrets/new-key.pem"))
      }

      provisioner "local-exec" {
        command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user --private-key /var/lib/jenkins/secrets/new-key.pem -i '${aws_instance.unbound_instance-${count.index+1}.public_ip},' unbound_setup.yml"
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

# store the cloudwatch configuration in the AWS Systems Manager Parameter Store
resource "aws_ssm_parameter" "cw_agent" {
     description = "Cloudwatch agent config to configure custom log"
  name        = "cloudwatch-config"
  type        = "String"
  value       = file("cloudwatch_config.json")
}
