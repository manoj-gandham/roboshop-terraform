locals {
  tags = {
    project = "Roboshop"
    bussiness_unit = "Retail"
    bussiness_type = "Ecommerce"
    env = local.tags
  }
}