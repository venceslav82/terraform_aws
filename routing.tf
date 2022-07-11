resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.Test-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    Name = "public-route"
  }
}

resource "aws_route_table_association" "Public-Association" {
  subnet_id      = aws_subnet.public-network.id
  route_table_id = aws_route_table.public-route.id
}