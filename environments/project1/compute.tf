module "lambda" {
  source        = "../../modules/lambda"
  project_name  = var.project_name
  lab_role_arn  = data.aws_iam_role.lab_role.arn
  s3_bucket_id  = module.storage.s3_bucket_id
  s3_bucket_arn = module.storage.s3_bucket_arn
}

module "compute" {
  source             = "../../modules/compute"
  project_name       = var.project_name
  aws_region         = var.aws_region
  vpc_id             = module.networking.vpc_id
  subnet_ids         = module.networking.public_subnet_ids
  alb_sg_id          = module.networking.alb_sg_id
  ecs_sg_id          = module.networking.ecs_sg_id
  lab_role_arn       = data.aws_iam_role.lab_role.arn
  db_url             = module.storage.jdbc_url
  db_username        = var.db_username
  db_password        = var.db_password
  s3_bucket_name     = module.storage.s3_bucket_name
  cognito_issuer_uri = module.auth.issuer_uri
  auth_enabled       = var.auth_enabled
}