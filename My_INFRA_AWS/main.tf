provider "aws" {
  region = "us-east-1"

  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  user_data = file("${path.module}/US.sh")

  tags = {
    Name = "NodeApp-Ubuntu"
  }
}


output "public_ip" {
  value = aws_instance.web.public_ip
}

