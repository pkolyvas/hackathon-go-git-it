terraform {
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = ">= 4.4.0"
      }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_route53_zone" "hackathon public" {
    name = "gogitit.online"
}