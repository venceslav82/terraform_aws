
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.Test-VPC.id
  tags = {
    Name = "internet-gateway"
  }
}