provider "aws" {
  region = "eu-central-1"
  profile = "default"
}


resource "aws_instance" "prod-instance" {
  count         = 2
  ami           = "ami-06912d73bfa9ce345"
  instance_type = "t2.micro"

  tags = {
    Name = "prod-instance-${count.index + 1}"
  }
}