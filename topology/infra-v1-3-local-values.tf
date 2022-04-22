# Define Local Values in Terraform
locals {
  owners      = var.business_division
  environment = var.environment
  name        = "${var.business_division}-${var.environment}"
  # commons_tags is a map expression, which is used to capture two attributes that will be used in future
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}
