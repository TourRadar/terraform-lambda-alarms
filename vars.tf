variable "actions" {
  description = "List of actions what should be executed"
  type        = list(string)
}
variable "function_name" {
  type = string
}

variable "alarm_prefix" {
  type = string
}

variable "tags" {
  default = {}
}

variable "errors_threshold" {
  type    = number
  default = 1
}

variable "errors_evaluation_periods" {
  type    = number
  default = 1
}

variable "errors_period" {
  type    = number
  default = 60
}


variable "duration_minimum_threshold" {
  type    = number
  default = 0
}

variable "duration_minimum_evaluation_periods" {
  type    = number
  default = 1
}

variable "duration_minimum_period" {
  type    = number
  default = 60
}


variable "duration_maximum_threshold" {
  type    = number
  default = 30
}

variable "duration_maximum_evaluation_periods" {
  type    = number
  default = 1
}

variable "duration_maximum_period" {
  type    = number
  default = 60
}