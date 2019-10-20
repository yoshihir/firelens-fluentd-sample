resource "aws_vpc" "firelens-fluentd" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "firelens-fluentd-vpc"
  }
}