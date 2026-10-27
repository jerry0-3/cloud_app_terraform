resource "random_id" "bucket_suffix" {
  byte_length = 4
}

locals {
  s3_bucket_name = "${var.project_name}-media-${random_id.bucket_suffix.hex}"
}

# Tworzenie koszyka bezpośrednio przez AWS CLI
resource "terraform_data" "s3_media_bucket" {
  input = local.s3_bucket_name

  provisioner "local-exec" {
    command = "aws s3 mb s3://${self.input} --region ${var.aws_region}"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "aws s3 rb s3://${self.output} --force --region us-east-1"
  }
}

resource "aws_db_subnet_group" "rds" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "postgres" {
  identifier             = "${var.project_name}-postgres"
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  vpc_security_group_ids = [var.rds_sg_id]
  publicly_accessible    = false
  skip_final_snapshot    = true
}