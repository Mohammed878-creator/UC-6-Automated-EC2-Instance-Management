output "arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.lamb_fn.arn
}

output "function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.lamb_fn.function_name
}