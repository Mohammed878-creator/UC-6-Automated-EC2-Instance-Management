resource "aws_cloudwatch_event_rule" "cloud_watch_lambda_ec2_rule" {
  name                = var.rule_name
  description         = "Scheduled rule for ${var.rule_name}"
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "cloud_watch_event_lambda_ec2_rule" {
  rule      = aws_cloudwatch_event_rule.cloud_watch_lambda_ec2_rule.name
  target_id = "${var.rule_name}_target"
  arn       = var.lambda_arn
}

resource "aws_lambda_permission" "this" {
  statement_id  = "AllowExecutionFromEventBridge_${var.rule_name}"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.cloud_watch_lambda_ec2_rule.arn
}