resource "aws_cloudwatch_event_rule" "iam_rotation_rule" {
  name        = "iam_rotation_rule"
  description = "Triggers the IAM rotation Lambda function"
  schedule_expression = "rate(1 day)"
}

resource "aws_cloudwatch_event_target" "iam_rotation_target" {
  rule      = aws_cloudwatch_event_rule.iam_rotation_rule.name
  target_id = "IAMRotationLambda"
  arn       = var.lambda_function_arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_invoke_lambda" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.iam_rotation_rule.arn
}