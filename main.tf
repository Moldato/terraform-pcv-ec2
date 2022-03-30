terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = var.profile_name
  region  = var.region
}

resource "aws_instance" "api" {
  ami                    = "ami-064ff912f78e3e561"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.api-sg.id]

  tags = {
    Name = "X Miner Api"
  }
}

