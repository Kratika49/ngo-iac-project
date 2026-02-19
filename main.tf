provider "aws" {
  region = "ap-south-1"
}

# Security Group to allow SSH (22) and Flask port (5000)
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
  ami           = "ami-0f5ee92e2d63afc18"  # Amazon Linux 2
  instance_type = "t2.micro"
  security_groups = [aws_security_group.ngo_sg.name]

  tags = {
    Name = "NGO-Server"
  }

  # This runs automatically on first boot
  user_data = <<-EOF
              #!/bin/bash
              # Update system
              yum update -y

              # Install Docker
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user

              # Pull Docker image from Docker Hub
              docker pull ngodevops2026/ngo-app:latest

              # Run the container on port 5000
              docker run -d -p 5000:5000 ngodevops2026/ngo-app:latest
              EOF
}
