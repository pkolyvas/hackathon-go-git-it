terraform {
  backend "remote" {
    organization = "shiftfocus"
    workspaces {
      name = "hackathon-go-git-it"
    }
  }
}


provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  name = "hackathon-grafana-vpc"
  cidr = "10.194.0.0/16"

  azs             = ["us-east-2a", "us-east-2b"]
  private_subnets = ["10.194.1.0/24", "10.194.2.0/24"]
  public_subnets  = ["10.194.11.0/24", "10.194.22.0/24"]

  enable_nat_gateway = false
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "grafana_hackathon" {
  key_name   = "grafana_hackathon_rsa"
  public_key = tls_private_key.private_key.public_key_openssh
}
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "ip" {
  value = aws_instance.hackathon_instance.public_ip
}

output "nameserver" {
  value = aws_route53_zone.hackathon_public.name_servers
}
