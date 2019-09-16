variable "actions" {
  description = "List of actions what should be executed"
  type        = list(string)
}

variable "ok_actions" {
  description = "List of actions what should be executed"
  type        = list(string)
  default     = []
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


variable "errors_checks" {
  type = map(number)
  default = {
    P1 = 5
    P2 = 4
    P3 = 3
    P4 = 2
    P5 = 1
  }
}

variable "errors_evaluation_periods" {
  type    = number
  default = 1
}

variable "errors_period" {
  type    = number
  default = 60
}


variable "errors_treat_missing_data" {
  type    = string
  default = "notBreaching"
}


variable "throttles_checks" {
  type = map(number)
  default = {
    P1 = 5
    P2 = 4
    P3 = 3
    P4 = 2
    P5 = 1
  }
}

variable "throttles_evaluation_periods" {
  type    = number
  default = 1
}

variable "throttles_period" {
  type    = number
  default = 60
}

variable "throttles_treat_missing_data" {
  type    = string
  default = "notBreaching"
}



variable "duration_minimum_enabled" {
  type    = bool
  default = true
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

variable "duration_minimum_treat_missing_data" {
  type    = string
  default = "notBreaching"
}


variable "duration_maximum_enabled" {
  type    = bool
  default = true
}

variable "duration_maximum_threshold" {
  type        = number
  default     = 30 * 1000
  description = "In MS"
}

variable "duration_maximum_evaluation_periods" {
  type    = number
  default = 1
}

variable "duration_maximum_period" {
  type    = number
  default = 60
}

variable "duration_maximum_treat_missing_data" {
  type    = string
  default = "notBreaching"
}