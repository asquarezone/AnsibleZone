# get default vpc id

data "aws_vpc" "default" {
  default = true
}

# security group to open all the inbound ports
resource "aws_security_group" "allow_all" {
  name        = "allow_all_for_ansible"
  description = "Allow all inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# get ubuntu 22.04 ami
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# create a key from the key pair
resource "aws_key_pair" "docker-key" {
  key_name   = "docker-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# ec2 instance with docker installed
resource "aws_instance" "ansible" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.docker-key.key_name
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true

  tags = {
    Name = "lt-spc"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} ansible_ssh_private_key_file=~/.ssh/id_rsa > hosts"
  }
}

resource "null_resource" "deploy" {
    triggers = {
      build_number = timestamp()
    }
    provisioner "local-exec" {
        command = "ansible-playbook -i hosts ./playbook/deployspc.yaml"
      
    }

    depends_on = [ aws_instance.ansible ]

  
}