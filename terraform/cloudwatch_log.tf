resource "aws_cloudwatch_log_group" "firelens-fluentd-cloudwatch-log-group" {
  name = "/ecs/firelens-fluentd"
  retention_in_days = 1
}