variable "project_name" { type = string }
variable "aws_region" { type = string }
variable "subnet_ids" { type = list(string) }
variable "rds_sg_id" { type = string }
variable "db_name" { type = string }
variable "db_username" { type = string }
variable "db_password" {
  type      = string
  sensitive = true
}