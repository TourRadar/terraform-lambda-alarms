resource "aws_cloudwatch_metric_alarm" "errors" {
  for_each            = var.errors_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Count of invocation errors are to high for ${var.function_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.errors_evaluation_periods
  threshold           = each.value
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = var.errors_period
  statistic           = "Sum"
  alarm_description   = "Priority: ${each.key}  Measures the number of invocations that failed due to errors in the function (response code 4XX). Failed invocations may trigger a retry attempt that succeeds. This includes: Handled exceptions (for example, context.fail(error)), Unhandled exceptions causing the code to exit, Out of memory exceptions, Timeouts, Permissions errors. This does not include invocations that fail due to invocation rates exceeding default concurrent limits (error code 429) or failures due to internal service errors (error code 500)."
  treat_missing_data  = var.errors_treat_missing_data
  alarm_actions       = var.actions
  ok_actions          = var.ok_actions
  tags                = var.tags

  dimensions = {
    FunctionName = var.function_name
  }
}



resource "aws_cloudwatch_metric_alarm" "throttles" {
  for_each            = var.throttles_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Throttles limit reached ${var.function_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.throttles_evaluation_periods
  threshold           = each.value
  metric_name         = "Throttles"
  namespace           = "AWS/Lambda"
  period              = var.throttles_period
  statistic           = "Sum"
  alarm_description   = "Priority: ${each.key}  Measures the number of Lambda function invocation attempts that were throttled due to invocation rates exceeding the customer’s concurrent limits (error code 429). Failed invocations may trigger a retry attempt that succeeds."
  treat_missing_data  = var.throttles_treat_missing_data
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
  for_each            = var.duration_maximum_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Duration of execution is to high for ${var.function_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.duration_maximum_evaluation_periods
  threshold           = each.value
  metric_name         = "Duration"
  namespace           = "AWS/Lambda"
  period              = var.duration_maximum_period
  statistic           = "Average"
  alarm_description   = "Priority: ${each.key} Execution duration is to high, above threshold: ${each.value}"
  treat_missing_data  = var.duration_maximum_treat_missing_data
  alarm_actions       = var.actions
  ok_actions          = var.ok_actions
  tags                = var.tags

  dimensions = {
    FunctionName = var.function_name
  }
}