output "frontend_application_url" {
  description = "Adres URL aplikacji Frontend"
  value       = module.compute.frontend_url
}

output "backend_api_url" {
  description = "Adres URL API Backend (automatycznie przekazany do Frontend)"
  value       = module.compute.backend_url
}

output "ecr_backend_repository" {
  value = module.compute.ecr_backend_url
}

output "ecr_frontend_repository" {
  value = module.compute.ecr_frontend_url
}

output "s3_media_bucket" {
  value = module.storage.s3_bucket_name
}

output "cognito_hosted_ui_url" {
  description = "Link do logowania/rejestracji w AWS Cognito"
  value       = module.auth.hosted_ui_login_url
}