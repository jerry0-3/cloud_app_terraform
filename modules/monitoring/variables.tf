variable "project_name" { type = string }
variable "alert_email" { type = string }
variable "latency_threshold_ms" {
  type    = number
  default = 2000
}