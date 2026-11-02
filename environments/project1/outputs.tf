output "frontend_application_url" {
  description = "Adres HTTPS aplikacji Frontend"
  value       = module.compute.frontend_url
}

output "backend_api_url" {
  description = "Adres HTTPS API Backend"
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