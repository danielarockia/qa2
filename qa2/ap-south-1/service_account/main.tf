variable "cluster_name" {}
variable "env" {}
variable "region" {}

module "service_account" {

  source       = "git::https://github.com/danielarockia/qa2-modules.git//service_account"
  cluster_name = var.cluster_name
  env          = var.env
  region       = var.region

}
