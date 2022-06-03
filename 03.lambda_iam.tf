resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda_EC2-Scheduler"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}
resource "aws_iam_policy" "lambda_policy" {
  name        = "EC2AccessPolicy"
  path        = "/"
  description = "EC2 Start,Stop,Describe Policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:Describe*",
                "ec2:Start*",
                "ec2:Stop*"
            ],
            "Resource": "*"
      },
    ]
  })
}
resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_policy.arn # policy alias.arn
} 