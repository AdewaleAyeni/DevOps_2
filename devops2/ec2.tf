provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo-server" {
    ami = "ami-06ca3ca175f37dd66"
    instance_type = "t2.micro"
    key_name = "projectv1"
    security_groups = ["demo-project-sg"]
}
resource "aws_security_group" "demo-project-sg" {
  name        = "demo-project-sg"
  description = "SSH Access"
  

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-port"
  }
}