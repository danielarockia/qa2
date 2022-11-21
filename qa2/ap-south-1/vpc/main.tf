variable "region" {}
variable "newbits" {}
variable "subnets_count" {}
variable "private_subnets_count" {}
variable "name_prefix" {}

provider "aws" {
  region = var.region
}


module "subnet" {
  source                = "git::https://github.com/danielarockia/qa2-modules.git//vpc"
  name_prefix           = var.name_prefix
  newbits               = var.newbits
  subnets_count         = var.subnets_count
  private_subnets_count = var.private_subnets_count
  tags = {

    APPLICATIONENV = "dev"
    SERVICENAME    = "devops"


  }
}

output "subnets_layer1" {
  value = module.subnet.subnets_layer1
}

# output "subnets_layer2" {
#   value = module.subnet.subnets_layer2
# }

output "subnets_public" {
  value = module.subnet.subnets_public
}

data "aws_vpc" "defaultvpc" {

  default = true
}
