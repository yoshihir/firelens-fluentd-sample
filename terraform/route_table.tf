resource "aws_route_table" "firelens-fluentd-public-rt" {
  vpc_id = aws_vpc.firelens-fluentd.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.firelens-fluentd-internet-gateway.id
  }

  tags = {
    Name = "firelens-fluentd-public-rt"
  }
}

resource "aws_route_table_association" "public-1a" {
  subnet_id = aws_subnet.firelens-fluentd-subnet-public-1a.id
  route_table_id = aws_route_table.firelens-fluentd-public-rt.id
}

resource "aws_route_table_association" "public-1c" {
  subnet_id = aws_subnet.firelens-fluentd-subnet-public-1c.id
  route_table_id = aws_route_table.firelens-fluentd-public-rt.id
}
