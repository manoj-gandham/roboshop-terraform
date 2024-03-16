module "vpc" {
  source = "git::https://github.com/manoj-gandham/tf-module-vpc.git"
  for_each = var.vpc
  cidr_block = each.value["cidr_block"]
}