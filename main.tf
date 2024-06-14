resource "aws_instance" "prod-instance" {
  count         = 2
  ami           = "ami-06912d73bfa9ce345"
  instance_type = "t2.micro"
  tags = {
    Name = "prod-instance-${count.index + 1}"
  }
}


  resource "aws_bucket" "prod-s3_bucket" {
  count = 2
  acl = "private"
  tags = {
    bucket = "prod-bucket-${count.index + 1}"
  }
}

  resource "vpc" {
  source = "terraform-aws-files.git/vpc/aws"

  name = "prod-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "prod"
  }
}
