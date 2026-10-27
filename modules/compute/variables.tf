variable "project_name" { type = string }
variable "aws_region" { type = string }
variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "alb_sg_id" { type = string }
variable "ecs_sg_id" { type = string }
variable "lab_role_arn" { type = string }

variable "db_url" { type = string }
variable "db_username" { type = string }
variable "db_password" {
  type      = string
  sensitive = true
}
variable "s3_bucket_name" { type = string }
variable "cognito_issuer_uri" { type = string }
variable "auth_enabled" {
  type    = bool
  default = false
}