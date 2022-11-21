variable "domain" {}

variable "records" {
  type = list(any)
}
variable "cluster_name" {
  type = string
}

module "private_zone" {
  source       = "git::https://github.com/danielarockia/qa2-modules.git//privatehostedzone"
  domain       = var.domain
  records      = var.records
  cluster_name = var.cluster_name
}