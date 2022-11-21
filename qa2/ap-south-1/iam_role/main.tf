variable "region" {}
variable "env" {}


provider "aws" {
  region = var.region
}

module "iamrole" {
  source = "git::https://github.com/danielarockia/qa2-modules.git//iam_roles"
  env    = var.env
  region = var.region
}

