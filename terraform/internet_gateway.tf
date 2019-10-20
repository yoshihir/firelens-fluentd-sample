resource "aws_internet_gateway" "firelens-fluentd-internet-gateway" {
  vpc_id = aws_vpc.firelens-fluentd.id
  tags = {
    Name = "firelens-fluentd-igw"
  }
}