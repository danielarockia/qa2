remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "ekstg-terraform-state"

    key = "${path_relative_to_include()}/terraform1.tfstate"
    region         = "us-east-2"
    encrypt        = true
    #dynamodb_table = "my-lock-table"
  }
}

inputs = {
  region                               = "us-east-2"
  env                                  = "aw_prd"
  
  #Subnet Creation
  name_prefix                          = "prd"
  newbits                              = "24"
  subnets_count                        = "2"
  private_subnets_count                = "2"
  cluster_name                         = "awprd"
  
  #Worker Node
  keyname                              = "devops" #ssh key name
  min_instance_count                   = "1"
  max_instance_count                   = "4"
  desired_instance_count               = "1"
  ami                                  = "amazon-eks-node-1.22-v*"
  instance_type                        = "t3.large"
  
  #Cluster Version
  k8s_version                          = "1.22"
  
  #Helm Version
  version_argocd                       = "5.5.3"
  version_aws-load-balancer-controller = "1.4.5"
  version_aws-ebs-csi-driver           = "2.12.0"
  version_metrics-server               = "3.7.0"
  version_istio_istiod                 = "1.15.3"
  version_istio_base                   = "1.15.3"
  version_istio_ingress                = "1.15.3"
  
  #Namespace Creation 
  foundationlayer_namespace   =  [ { "namespace_name" : "lb" },{ "namespace_name" : "argocd" },
                                { "namespace_name" : "istio-system" },
                                { "namespace_name" : "external-dns" },{ "namespace_name" : "cluster-autoscaler" },
                                { "namespace_name" : "istio-gateway" }]
  
  app_namespace               = [ {"namespace_name" : "core" },{ "namespace_name" : "io" },
                                { "namespace_name" : "ia" },{ "namespace_name" : "istio-ingress" },{ "namespace_name" : "ui" }]
 
  #Private Hosted Zone
  domain = "aw.io"
  records= ["*.aw.io","*.ia.aw.io"]
}

