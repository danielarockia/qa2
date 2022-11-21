variable "cluster_name" {}
variable "env" {}
variable "region" {}
variable "foundationlayer_namespace" {
  type = list(object({
    namespace_name = string
  }))
}
variable "app_namespace" {
  type = list(object({
    namespace_name = string
  }))
}
variable "version_argocd" {}
variable "version_aws-load-balancer-controller" {}
variable "version_aws-ebs-csi-driver" {}
variable "version_metrics-server" {}
variable "version_istio_istiod" {}
variable "version_istio_base" {}
variable "version_istio_ingress" {}
variable "version_external_dns" {}

module "foundationlayer" {
  source                               = "git::https://github.com/danielarockia/qa2-modules.git//foundation_layers"
  cluster_name                         = var.cluster_name
  env                                  = var.env
  region                               = var.region
  version_argocd                       = var.version_argocd
  version_aws-load-balancer-controller = var.version_aws-load-balancer-controller
  version_aws-ebs-csi-driver           = var.version_aws-ebs-csi-driver
  version_metrics-server               = var.version_metrics-server
  version_istio_istiod                 = var.version_istio_istiod
  version_istio_base                   = var.version_istio_base
  version_istio_ingress                = var.version_istio_ingress
  version_external_dns                 = var.version_external_dns
  app_namespace                        = var.app_namespace
  foundationlayer_namespace            = var.foundationlayer_namespace

}