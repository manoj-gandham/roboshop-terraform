output "vpc" {
  value = lookup(lookup(module.vpc, null), "subnets", null)
}
