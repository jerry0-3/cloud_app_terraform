module "storage" {
  source       = "../../modules/storage"
  project_name = var.project_name
  aws_region   = var.aws_region
  subnet_ids   = module.networking.public_subnet_ids
  rds_sg_id    = module.networking.rds_sg_id
  db_name      = var.db_name
  db_username  = var.db_username
  db_password  = var.db_password
}

module "auth" {
  source       = "../../modules/auth"
  project_name = var.project_name
  aws_region   = var.aws_region
}