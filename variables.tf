variable "instance_id" {
   type = string
   default = "i-05ae8374c0ad67c17"
}

variable "start_schedule" {
   type = string
   default = "cron(15 10 ? * MON-FRI *)"
}

variable "stop_schedule" {
  type = string
  default = "cron(12 10 ? * MON-FRI *)"
}

variable "name_prefix" {
  type = string
  default = "prod_ec2_scheduler"
}
