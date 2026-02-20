provider "aws" {
  region = "ap-south-1"
}

# Security Group
resource "aws_security_group" "ngo_sg" {
  name        = "ngo-server-sg"
  description = "Allow SSH and Flask port"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "ngo_server" {
  ami             = "ami-0f5ee92e2d63afc18"  # Amazon Linux 2
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.ngo_sg.name]

  tags = {
    Name = "NGO-Server"
  }

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    service docker start
    usermod -a -G docker ec2-user
    docker pull ngodevops2026/ngo-app:latest
    docker run -d -p 5000:5000 ngodevops2026/ngo-app:latest
  EOF
}