# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket  = "ekstg-terraform-state"
    encrypt = true
    key     = "dev/ap-south-1/vpc/terraform1.tfstate"
    region  = "us-east-2"
  }
}
