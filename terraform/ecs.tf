resource "aws_ecs_cluster" "firelens-fluentd-cluster" {
  name = "firelens-fluentd-cluster"
}

resource "aws_ecs_service" "firelens-fluentd" {
  name = "firelens-fluentd"
  cluster = aws_ecs_cluster.firelens-fluentd-cluster.id
  task_definition = aws_ecs_task_definition.task-definition.arn
  desired_count = 1
  enable_ecs_managed_tags = true
  health_check_grace_period_seconds = 0
  launch_type = "FARGATE"
  platform_version = "LATEST"
  propagate_tags = "TASK_DEFINITION"
  tags = {}
  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.firelens-fluentd-target-group.arn
    container_name = "nginx"
    container_port = 80
  }

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.firelens-fluentd-sg.id
    ]
    subnets = [
      aws_subnet.firelens-fluentd-subnet-public-1a.id,
      aws_subnet.firelens-fluentd-subnet-public-1c.id,
    ]
  }
}

resource "aws_ecs_task_definition" "task-definition" {
  family                = "firelens-fluentd"
  container_definitions = file("file/task-definition.json")
  task_role_arn            = aws_iam_role.ecs-task-role.arn
  execution_role_arn       = "arn:aws:iam::xxxxxxxxxxx:role/ecsTaskExecutionRole"
  network_mode             = "awsvpc"
  memory                   = "1024"
  cpu                      = "512"
  requires_compatibilities = ["FARGATE"]
}