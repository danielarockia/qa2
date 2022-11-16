variable "cluster_name" {}
variable "env" {}


module "oidc" {

  source = "D:\\AWS-TF\\tf-helm-singsub-oidc\\infra-terraform\\modules\\oidc"
  cluster_name = var.cluster_name
  env = var.env

}
