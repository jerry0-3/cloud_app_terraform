output "s3_bucket_name" {
  description = "Nazwa koszyka S3"
  value       = local.s3_bucket_name
  depends_on  = [terraform_data.s3_media_bucket]
}

output "s3_bucket_arn" {
  description = "ARN koszyka S3"
  value       = "arn:aws:s3:::${local.s3_bucket_name}"
  depends_on  = [terraform_data.s3_media_bucket]
}

output "s3_bucket_id" {
  description = "ID / nazwa koszyka S3"
  value       = local.s3_bucket_name
  depends_on  = [terraform_data.s3_media_bucket]
}

output "jdbc_url" {
  value = "jdbc:postgresql://${aws_db_instance.postgres.endpoint}/${var.db_name}"
}