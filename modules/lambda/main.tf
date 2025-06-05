data "archive_file" "zip_file" {
  type        = "zip"
  source_file = var.source_file
  output_path = "${path.module}/${var.function_name}.zip"
}

resource "aws_lambda_function" "lamb_fn" {
  filename      = data.archive_file.zip_file.output_path
  function_name = var.function_name
  role          = var.role_arn
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout

  environment {
    variables = var.environment_vars
  }

  source_code_hash = data.archive_file.zip_file.output_base64sha256
}