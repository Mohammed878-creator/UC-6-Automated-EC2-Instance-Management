#creating IAM Role
resource "aws_iam_role" "lambda_iam_role" {
  name = "${var.name_prefix}_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

#IAM role ARN
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

#Creating Policy to start and stop the ec2 instance
resource "aws_iam_policy" "ec2_start_stop" {
  name        = "${var.name_prefix}_EC2StartStopPolicy"
  description = "Policy to allow starting and stopping EC2 instances"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:DescribeInstances"
        ],
        Resource = "*"
      }
    ]
  })
}

#Attaching Policy to IAM Role
resource "aws_iam_role_policy_attachment" "ec2_start_stop" {
  role       = aws_iam_role.lambda_iam_role.name
  policy_arn = aws_iam_policy.ec2_start_stop.arn
}