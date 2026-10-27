module "monitoring" {
  source       = "../../modules/monitoring"
  project_name = var.project_name
  alert_email  = var.alert_email
}