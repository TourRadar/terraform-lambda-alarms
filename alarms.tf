resource "aws_cloudwatch_metric_alarm" "errors" {
  count               = var.errors_enabled ? 1 : 0
  alarm_name          = "${var.alarm_prefix}: Count of invocation errors are to high for ${var.function_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.errors_evaluation_periods
  threshold           = var.errors_threshold
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = var.errors_period
  statistic           = "Sum"
  alarm_description   = "Count of errors are above threshold: ${var.errors_threshold}"
  treat_missing_data  = var.errors_treat_missing_data
  alarm_actions       = var.actions
  ok_actions          = var.ok_actions
  tags                = var.tags

  dimensions = {
    FunctionName = var.function_name
  }
}

resource "aws_cloudwatch_metric_alarm" "duration-minimum" {
  count               = var.duration_minimum_enabled ? 1 : 0
  alarm_name          = "${var.alarm_prefix}: Duration of execution is to short for ${var.function_name}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.duration_minimum_evaluation_periods
  threshold           = var.duration_minimum_threshold
  metric_name         = "Duration"
  namespace           = "AWS/Lambda"
  period              = var.duration_minimum_period
  statistic           = "Average"
  alarm_description   = "Count of errors are above threshold: ${var.duration_minimum_threshold}"
  treat_missing_data  = var.duration_minimum_treat_missing_data
  alarm_actions       = var.actions
  ok_actions          = var.ok_actions
  tags                = var.tags

  dimensions = {
    FunctionName = var.function_name
  }
}

resource "aws_cloudwatch_metric_alarm" "duration-high" {
  count               = var.duration_maximum_enabled ? 1 : 0
  alarm_name          = "${var.alarm_prefix}: Duration of execution is to high for ${var.function_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.duration_maximum_evaluation_periods
  threshold           = var.duration_maximum_threshold
  metric_name         = "Duration"
  namespace           = "AWS/Lambda"
  period              = var.duration_maximum_period
  statistic           = "Average"
  alarm_description   = "Execution duration is to high, above threshold: ${var.duration_maximum_threshold}"
  treat_missing_data  = var.duration_maximum_treat_missing_data
  alarm_actions       = var.actions
  ok_actions          = var.ok_actions
  tags                = var.tags

  dimensions = {
    FunctionName = var.function_name
  }
}