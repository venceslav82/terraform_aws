//Public network for web server

resource "aws_subnet" "public-network" {
  cidr_block = "192.168.0.0/24"
  vpc_id     = aws_vpc.Test-VPC.id
  map_public_ip_on_launch = true
  tags = {
    Name = "public-network"
  }

}


//Private network for db server

resource "aws_subnet" "private-network" {
  cidr_block = "192.168.99.0/24"
  vpc_id     = aws_vpc.Test-VPC.id
  tags = {
    Name = "private-network"
  }

}