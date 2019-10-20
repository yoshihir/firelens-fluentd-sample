resource "aws_security_group" "firelens-fluentd-alb-sg" {
  name = "alb-sg"
  description = "alb-sg"
  vpc_id = aws_vpc.firelens-fluentd.id
  revoke_rules_on_delete = false

  tags = {
    Name = "firelens-fluentd-alb-sg"
  }
}

resource "aws_security_group_rule" "firelens-fluentd-alb-sg" {
  security_group_id = aws_security_group.firelens-fluentd-alb-sg.id
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [
    "0.0.0.0/0"]
}

resource "aws_security_group_rule" "firelens-fluentd-alb-sg-1" {
  security_group_id = aws_security_group.firelens-fluentd-alb-sg.id
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"]
}

resource "aws_security_group_rule" "firelens-fluentd-alb-sg-2" {
  security_group_id = aws_security_group.firelens-fluentd-alb-sg.id
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  ipv6_cidr_blocks = [
    "::/0"]
}

resource "aws_security_group" "firelens-fluentd-sg" {
  name = "firelens-fluentd-sg"
  description = "firelens-fluentd-sg"
  vpc_id = aws_vpc.firelens-fluentd.id
  revoke_rules_on_delete = false

  tags = {
    Name = "firelens-fluentd-sg"
  }
}

resource "aws_security_group_rule" "firelens-fluentd-sg" {
  security_group_id = aws_security_group.firelens-fluentd-sg.id
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  ipv6_cidr_blocks = []
  prefix_list_ids = []
  cidr_blocks = [
    "0.0.0.0/0"]
}

resource "aws_security_group_rule" "firelens-fluentd-sg-1" {
  security_group_id = aws_security_group.firelens-fluentd-sg.id
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  ipv6_cidr_blocks = []
  prefix_list_ids = []
  cidr_blocks = [
    "0.0.0.0/0"]
}