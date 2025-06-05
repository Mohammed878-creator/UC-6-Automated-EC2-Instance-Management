terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
 }

  }
  required_version = ">= 1.10.0"
}

module "ec2_scheduler" {
  source        = "./modules/ec2-scheduler"
  instance_id   = var.instance_id
  start_schedule = var.start_schedule # 8 AM weekdays
  stop_schedule  = var.stop_schedule # 5 PM weekdays
  name_prefix    = var.name_prefix
}