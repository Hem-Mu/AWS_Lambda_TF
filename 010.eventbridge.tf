resource "aws_cloudwatch_event_rule" "console" {
  name        = "EC2-Scheduler"
  description = "EC2-Scheduler with Lambda"
  event_pattern = <<EOF
{
  "detail-type": [
    "AWS Console Sign In via CloudTrail"
  ]
}
EOF
# schedule_expression = 10 # 아직 양식 모름
}