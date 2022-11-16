variable "domain" {}

variable "records" {
    type = list
}
variable "cluster_name" {
  type = string
}

module "private_zone" {
  source = "D:\\AWS-TF\\tf-helm-singsub-oidc\\infra-terraform\\modules\\privatehostedzone"
  domain = var.domain
  records = var.records
  cluster_name = var.cluster_name
}