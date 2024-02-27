resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "private-ap-south-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.prisub1_cidr
  availability_zone = var.az1

  tags = {
    "Name"                            = var.prisub1_name
  }
}

resource "aws_subnet" "private-ap-south-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.prisub2_cidr
  availability_zone = var.az2

  tags = {
    "Name"                            = var.prisub2_name
  }
}

resource "aws_subnet" "public-ap-south-1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pubsub1_cidr
  availability_zone       = var.az1
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = var.pubsub1_name
  }
}

resource "aws_subnet" "public-ap-south-1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pubsub2_cidr
  availability_zone       = var.az2
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = var.pubsub2_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_eip" "eip1" {

  tags = {
    Name = var.eip1_name
  }
}

resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.public-ap-south-1a.id

  tags = {
    Name = var.nat1_name
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "eip2" {

  tags = {
    Name = var.eip2_name
  }
}

resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.public-ap-south-1b.id

  tags = {
    Name = var.nat2_name
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block                 = "0.0.0.0/0"
    nat_gateway_id             = aws_nat_gateway.nat1.id
  }

  tags = {
    Name = var.rtpri1_name
  }
}

resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat2.id
  }

  tags = {
    Name = var.rtpri2_name
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  
  tags = {
    Name = var.pubrt_name
  }
}

resource "aws_route_table_association" "private-ap-south-1a" {
  subnet_id      = aws_subnet.private-ap-south-1a.id
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private-ap-south-1b" {
  subnet_id      = aws_subnet.private-ap-south-1b.id
  route_table_id = aws_route_table.private2.id
}

resource "aws_route_table_association" "public-ap-south-1a" {
  subnet_id      = aws_subnet.public-ap-south-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-ap-south-1b" {
  subnet_id      = aws_subnet.public-ap-south-1b.id
  route_table_id = aws_route_table.public.id
}

