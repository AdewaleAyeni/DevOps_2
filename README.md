# DevOps_2
#create EC2 instance

provider "aws" {
  region     = "us-east-1"   
  
}

resource "aws_instance" "demo_server"{
    ami = "ami-01eccbf80522b562b"
    instance_type = "t2.micro"             
    key_name      = "ed-dpt-key"        

}

