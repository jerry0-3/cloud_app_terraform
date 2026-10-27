output "alarm_name" { value = aws_cloudwatch_metric_alarm.high_api_latency.alarm_name }
output "sns_topic_arn" { value = aws_sns_topic.alerts.arn }