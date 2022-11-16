variable "env" {} #Needtomodify (it should be same as what we give 'env' variable in iam main.tf)
variable "region" {} #Needtomodify
variable "cluster_name" {} #Needtomodify
variable "servicename" {default = "eksworker"}
variable "alertgroup" {default = "devops_team"}
variable "k8s_version" {} 


data "aws_iam_role" "ControlPlaneRole" {
  name = "${var.env}_EKSControlPlaneRole"
}

provider "aws" {
  region = "${var.region}"
}

module "eks_controlplane_generic" {
  source                = "D:\\AWS-TF\\tf-helm-singsub-oidc\\infra-terraform\\modules\\eks_controlplane_generic"
  name_prefix           = var.cluster_name
  k8s_version           = var.k8s_version
  private_endpoint      = false
  public_endpoint       = true
  servicename           = "eksworker"
  worker_subnets        = ["${data.aws_subnet_ids.worker.ids}"]
  env                   = var.env
  controlplane_iam_role = data.aws_iam_role.ControlPlaneRole.name
  alertgroup = var.alertgroup
  vpc_id = "${data.aws_vpc.defaultvpc.id}"
}