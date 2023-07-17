provider "aws" {
    region = "us-east-1"
  
}
 resource "aws_instance" "demoserver" {
  ami           = "ami-06ca3ca175f37dd66"
  instance_type = "t2.micro"
  key_name =  "demoproject"
  security_groups = demo_sg
 }
resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "SSH access"
  

  ingress {
    description = "SSH inbound"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "demo_sg"
  }
}