resource "aws_lb" "firelens-fluentd-alb" {
  name = "firelens-fluentd-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.firelens-fluentd-alb-sg.id]
  subnets = [
    aws_subnet.firelens-fluentd-subnet-public-1a.id,
    aws_subnet.firelens-fluentd-subnet-public-1c.id]
}

resource "aws_lb_target_group" "firelens-fluentd-target-group" {
  name = "firelens-fluentd-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.firelens-fluentd.id
  target_type = "ip"
  deregistration_delay = 60

  health_check {
    enabled = true
    healthy_threshold = 5
    interval = 30
    matcher = "200"
    path = "/"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 10
    unhealthy_threshold = 5
  }


}

resource "aws_lb_listener" "aws-alb-listener" {
  load_balancer_arn = aws_lb.firelens-fluentd-alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.firelens-fluentd-target-group.arn
  }
}