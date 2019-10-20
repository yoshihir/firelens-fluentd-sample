resource "aws_iam_role" "ecs-task-role" {
  name = "firelens-fluentd-ecs-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": ["ec2.amazonaws.com", "ecs-tasks.amazonaws.com"]
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "inline-policy" {
  name = "${aws_iam_role.ecs-task-role.name}-inline-policy"
  role = aws_iam_role.ecs-task-role.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "s3:GetObject",
        "s3:ListBucket",
        "s3:PutObject"
      ]
    }
  ]
}
POLICY
}