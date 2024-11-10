# output ssh command
output "ssh_command" {
  value = "ssh ubuntu@${aws_instance.ansible.public_ip}"
}

