resource "aws_sns_topic" "alerts" {
  name = "${var.project_name}-performance-alerts"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

resource "aws_cloudwatch_metric_alarm" "high_api_latency" {
  alarm_name          = "${var.project_name}-high-get-notes-latency"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ApiLatencyMs"
  namespace           = "CloudDemoApp"
  period              = 60
  statistic           = "Average"
  threshold           = var.latency_threshold_ms
  alarm_description   = "Alarm uruchamiany, gdy sredni czas odpowiedzi GET /api/notes przekroczy prog 2000 ms"
  treat_missing_data  = "notBreaching"

  dimensions = {
    Endpoint = "GET_notes"
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
  ok_actions    = [aws_sns_topic.alerts.arn]
}