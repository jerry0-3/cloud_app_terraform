variable "project_name" {
  type    = string
  default = "project1"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "db_name" {
  type    = string
  default = "cloudapp"
}

variable "db_username" {
  type    = string
  default = "postgres"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "alert_email" {
  type        = string
  description = "Adres e-mail, na ktory CloudWatch wysle powiadomienie o przekroczeniu czasu odpowiedzi"
}

variable "auth_enabled" {
  type        = bool
  default     = false
  description = "Czy wymuszac weryfikacje tokenu JWT z Cognito na endpoint POST/GET"
}