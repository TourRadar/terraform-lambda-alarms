# terraform-lambda-alarms
Terraform module to automate creating lambda alrams

## Example usage
```terraform
module "lambda-alarms" {
  source = "github.com/TourRadar/terraform-lambda-alarms"
  function_name = aws_lambda_function.main.arn
  actions      = ["snsarn etc"]
  alarm_prefix = "MyAlarmPrefix"
  tags = {
    Project = "SomeProject"
  }
}
```
