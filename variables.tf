variable "name" {
  type        = string
  description = "Name to use for resources created by this module"
}

variable "message_retention_seconds" {
  type        = number
  default     = 86400
  description = "Number of seconds for message retention"
}

variable "message_retention_seconds_deadletter" {
  type        = number
  default     = 345600
  description = "Number of seconds for message retention of deadletter messages"
}

variable "receive_wait_time_seconds" {
  type        = number
  default     = 10
  description = "Number of seconds for receive wait time"
}

variable "visibility_timeout_seconds" {
  type        = number
  default     = 180
  description = "Number of seconds for message visibility timeout"
}

variable "max_receive_count" {
  type        = number
  default     = 5
  description = "Number of times a message can be re-received"
}

variable "use_cmk" {
  type        = bool
  default     = true
  description = "Should we use a Customer Managed Key for envelope encryption?"
}

variable "enable_actions" {
  type        = bool
  default     = false
  description = "Should we enable alarm actions?"
}

variable "alarm_actions" {
  type = list(string)
  default = []
  description = "List of alarm action endpoints"
}

variable "alarm_description" {
  type = string
  default = "Monitors for messages sent to a deadletter queue."
  description = "Description to use for the deadletter monitor"
}

variable "alarm_name" {
  type = string
  default = "deadletter-alarm"
  description = "Description to use for the deadletter monitor"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Map of strings for tags to apply to resources created by this module"
}