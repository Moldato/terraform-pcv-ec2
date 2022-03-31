resource "aws_default_vpc" "default" {
  tags = {
    Name = "default-vpc"
  }
}

resource "aws_vpc" "private_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name = "${var.profile_name}-private-vpc"
  }
}

resource "aws_subnet" "vpc_subnet_a" {
  vpc_id            = aws_vpc.private_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "${aws_vpc.private_vpc.tags_all.Name}-subnet-${var.region}a"
  }
}

resource "aws_subnet" "vpc_subnet_b" {
  vpc_id            = aws_vpc.private_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.region}b"
  tags = {
    Name = "${aws_vpc.private_vpc.tags_all.Name}-subnet-${var.region}b"
  }
}

resource "aws_subnet" "vpc_subnet_c" {
  vpc_id            = aws_vpc.private_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.region}c"
  tags = {
    Name = "${aws_vpc.private_vpc.tags_all.Name}-subnet-${var.region}c"
  }
}

resource "aws_internet_gateway" "private_vpc_igw" {
  vpc_id = aws_vpc.private_vpc.id

  tags = {
    Name = "private-vpc-internet-gateway"
  }
}
