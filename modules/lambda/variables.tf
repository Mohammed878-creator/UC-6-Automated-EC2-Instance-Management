variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "python3.8"
}

variable "timeout" {
  description = "Lambda timeout in seconds"
  type        = number
  default     = 30
}

variable "role_arn" {
  description = "IAM role ARN for Lambda"
  type        = string
}

variable "environment_vars" {
  description = "Environment variables for Lambda"
  type        = map(string)
  default     = {}
}

variable "source_file" {
  description = "Path to the Lambda source file"
  type        = string
}