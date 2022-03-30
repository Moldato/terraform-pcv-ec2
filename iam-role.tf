resource "aws_iam_role" "instance-role" {
  name = "${var.profile_name}-instance-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name    = "${var.profile_name}-instance-role"
    tag-key = "tag-value"
  }
}

resource "aws_iam_role" "service-role" {
  name = "${var.profile_name}-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = [
            "codedeploy.amazonaws.com"
          ]
        }
      },
    ]
  })

  tags = {
    Name    = "${var.profile_name}-service-role"
    tag-key = "tag-value"
  }
}