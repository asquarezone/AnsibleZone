variable "region" {
  default     = "ap-south-1"
  description = "region to create ec2 instance with docker installed"
}

variable "instance_type" {
    default = "t2.micro"
    description = "set the instance type"
}