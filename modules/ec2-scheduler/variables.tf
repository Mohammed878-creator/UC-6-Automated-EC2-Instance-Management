variable "instance_id" {
  description = "ID of the EC2 instance to manage"
  type        = string
}

variable "start_schedule" {
  description = "Schedule expression for starting the instance"
  type        = string
  default     = "cron(0 8 ? * MON-FRI *)"
}

variable "stop_schedule" {
  description = "Schedule expression for stopping the instance"
  type        = string
  default     = "cron(0 17 ? * MON-FRI *)"
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "ec2_scheduler"
}