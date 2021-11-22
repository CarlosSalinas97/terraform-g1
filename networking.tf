resource "aws_vpc" "main1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    "Name" = "Main 1 VPC"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.main1.id //var.vpc1_id
  cidr_block              = var.subnet1_cidr //Cambiar, iria entre comillas. Ej: 192.168.0.0/24. Hay que subdividir la VPC por una que no esté usada y asignarla acá
  map_public_ip_on_launch = true

  availability_zone = var.subnet1_zone_1a //Cambiar la zona, us-east-1. Toma una cualquiera si no ponemos.

  tags = {
    "Name" = "Subnet 1 | Main 1"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main1.id //Poner el id de la VPC

  tags = {
    "Name" = "Gateway Main 1"
  }
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "table_subnet1" { //Asociar la subnet con al hoja de rutas
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.r.id
}