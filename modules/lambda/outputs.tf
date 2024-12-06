output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.promote_read_replica.function_name
}
