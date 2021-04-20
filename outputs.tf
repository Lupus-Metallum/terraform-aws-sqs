output "kms_key_id" {
  value = var.use_cmk == true ? aws_kms_key.this[0].key_id : ""
}
output "kms_key_alias_name" {
  value = var.use_cmk == true ? aws_kms_alias.this[0].name : ""
}
output "sqs_queue_arn" {
  value = aws_sqs_queue.this.arn
}
output "sqs_deadletter_queue_arn" {
  value = aws_sqs_queue.this_deadletter.arn
}
output "sqs_queue_id" {
  value = aws_sqs_queue.this.id
}
output "sqs_deadletter_queue_id" {
  value = aws_sqs_queue.this_deadletter.id
}
output "cloudwatch_alarm_id" {
  value = aws_cloudwatch_metric_alarm.this_deadletter.id
}
output "cloudwatch_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.this_deadletter.arn
}
