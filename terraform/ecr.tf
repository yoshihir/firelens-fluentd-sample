resource "aws_ecr_repository" "nginx" {
  name = "infra/nginx-1.17.4"
}

resource "aws_ecr_repository" "fluentd" {
  name = "infra/fluentd-1.7"
}