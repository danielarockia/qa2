# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket  = "ekstg-terraform-state"
    encrypt = true
    key     = "qa2/ap-south-1/eks/eks_worker_genric/terraform1.tfstate"
    region  = "us-east-2"
  }
}
