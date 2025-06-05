output "start_rule_arn" {
  value = module.start_event.rule_arn
}

output "stop_rule_arn" {
  value = module.stop_event.rule_arn
}

output "start_lambda_arn" {
  value = module.start_lambda.arn
}

output "stop_lambda_arn" {
  value = module.stop_lambda.arn
}