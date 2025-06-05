module "iam" {
  source      = "../iam"
  name_prefix = var.name_prefix
}

module "start_lambda" {
  source          = "../lambda"
  function_name   = "${var.name_prefix}_start_instance"
  handler         = "start_instance.lambda_handler"
  role_arn        = module.iam.role_arn
  environment_vars = {
    INSTANCE_ID = var.instance_id
  }
  source_file     = "${path.module}/lambda_code/start_instance.py"
}

module "stop_lambda" {
  source          = "../lambda"
  function_name   = "${var.name_prefix}_stop_instance"
  handler         = "stop_instance.lambda_handler"
  role_arn        = module.iam.role_arn
  environment_vars = {
    INSTANCE_ID = var.instance_id
  }
  source_file     = "${path.module}/lambda_code/stop_instance.py"
}

module "start_event" {
  source             = "../eventbridge"
  rule_name          = "${var.name_prefix}_start_rule"
  schedule_expression = var.start_schedule
  lambda_arn         = module.start_lambda.arn
}

module "stop_event" {
  source             = "../eventbridge"
  rule_name          = "${var.name_prefix}_stop_rule"
  schedule_expression = var.stop_schedule
  lambda_arn         = module.stop_lambda.arn
}