# IAM Role for Lambda
resource "aws_iam_role" "lambda_exec" {
  name               = "lambda-failover-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

# IAM Policy for Lambda Permissions
resource "aws_iam_policy" "lambda_failover_policy" {
  name        = "lambda-failover-policy"
  description = "Policy for Lambda to manage RDS and Auto Scaling groups"
  policy      = data.aws_iam_policy_document.lambda_permissions.json
}

# Attach policy to role
resource "aws_iam_role_policy_attachment" "lambda_failover_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.lambda_failover_policy.arn
}

# Lambda Function
resource "aws_lambda_function" "failover" {
  filename         = "failover_function.zip"
  function_name    = "failover-handler"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "failover_function.lambda_handler"
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("failover_function.zip")
  environment {
    variables = {
      READ_REPLICA_INSTANCE = var.read_replica_instance
      ASG_NAME              = var.backup_asg_name
    }
  }
}

# SNS Topic
resource "aws_sns_topic" "failover_topic" {
  name = "failover-notifications"
}

# SNS Subscription for Lambda
resource "aws_sns_topic_subscription" "lambda_subscription" {
  topic_arn = aws_sns_topic.failover_topic.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.failover.arn
}

# Allow SNS to invoke the Lambda function
resource "aws_lambda_permission" "sns_invoke_lambda" {
  statement_id  = "AllowSNSInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.failover.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.failover_topic.arn
}

# Health Check for Route 53
resource "aws_route53_health_check" "primary_health_check" {
  fqdn              = var.backup_fqdn
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"
}

# Trigger SNS when health check fails
resource "aws_route53_record" "primary_record" {
  zone_id = var.zone_id
  name    = var.primary_fqdn
  type    = "A"

  set_identifier = "backup" # Identifier for failover routing
  health_check_id = aws_route53_health_check.backup_health_check.id
  


}

