resource "random_id" "cognito_domain" {
  byte_length = 4
}

data "archive_file" "pre_signup_zip" {
  type        = "zip"
  source_file = "${path.module}/pre_signup.py"
  output_path = "${path.module}/pre_signup.zip"
}

resource "aws_lambda_function" "pre_signup" {
  function_name    = "${var.project_name}-cognito-auto-confirm"
  role             = var.lab_role_arn
  handler          = "pre_signup.lambda_handler"
  runtime          = "python3.12"
  filename         = data.archive_file.pre_signup_zip.output_path
  source_code_hash = data.archive_file.pre_signup_zip.output_base64sha256
}

resource "aws_cognito_user_pool" "main" {
  name                     = "${var.project_name}-user-pool"
  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = false
    require_uppercase = true
  }

  lambda_config {
    pre_sign_up = aws_lambda_function.pre_signup.arn
  }
}

resource "aws_lambda_permission" "allow_cognito" {
  statement_id  = "AllowExecutionFromCognito"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.pre_signup.function_name
  principal     = "cognito-idp.amazonaws.com"
  source_arn    = aws_cognito_user_pool.main.arn
}

resource "aws_cognito_user_pool_domain" "main" {
  domain       = "${var.project_name}-auth-${random_id.cognito_domain.hex}"
  user_pool_id = aws_cognito_user_pool.main.id
}

resource "aws_cognito_user_pool_client" "client" {
  name            = "${var.project_name}-client"
  user_pool_id    = aws_cognito_user_pool.main.id
  generate_secret = false

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH"
  ]
}