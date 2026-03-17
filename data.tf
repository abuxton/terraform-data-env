# ------------------------------------------------------------------------------
# data sources
# ------------------------------------------------------------------------------
data "environment_variables" "all" {}

data "external" "sys_info" {
  count   = var.enable_system_info ? 1 : 0
  program = ["sh", "${path.module}/scripts/wrapper.sh"]
}


