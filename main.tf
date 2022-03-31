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

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.profile_name}-ec2-profile"
  role = aws_iam_role.instance-role.name
  tags = {
    Name = "${var.profile_name} EC2 profile"
  }
}

resource "aws_instance" "api" {
  ami                  = "ami-064ff912f78e3e561"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  security_groups = [
    aws_security_group.api-sg.id
  ]
  subnet_id = aws_subnet.vpc_subnet_a.id

  tags = {
    Name = "${var.profile_name}-api"
  }
}

