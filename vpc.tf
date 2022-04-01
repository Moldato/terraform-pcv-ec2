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

# Definir Gateway para VPC
# Um gateway da Internet é um componente de VPC altamente disponível, 
# redundante e escalado horizontalmente que permite a comunicação entre sua VPC e a Internet.
# Para usar um gateway da Internet, associe-o à sua VPC e especifique-o 
# como um destino na tabela de rotas da sub-rede para tráfego IPv4 ou IPv6 roteável pela Internet. 
# Um gateway da Internet executa a conversão de endereços de rede (NAT) para instâncias que 
# receberam endereços IPv4 públicos.
resource "aws_internet_gateway" "private_vpc_igw" {
  vpc_id = aws_vpc.private_vpc.id

  tags = {
    Name = "${aws_vpc.private_vpc.tags_all.Name}-internet-gateway"
  }
}

# Definir rota para VPC
resource "aws_route_table" "vpc_route" {
  vpc_id = aws_vpc.private_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.private_vpc_igw.id
  }

  tags = {
    Name = "${aws_vpc.private_vpc.tags_all.Name}-route"
  }
}