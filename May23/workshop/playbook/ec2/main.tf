terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "gol" {
  ami             = "ami-0c65adc9a5c1b5d7c"
  instance_type   = "t2.micro"
  key_name = "tfansible"
  security_groups = ["openall"]
  tags = {
    Name = "gol"
  }
}
output "gol_url" {
  value = format("%s ansible_ssh_private_key_file=/home/ansible/tfansible.pem ansible_ssh_user=ubuntu",aws_instance.gol.public_ip)
}