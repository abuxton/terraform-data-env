# ------------------------------------------------------------------------------
# Output
# ------------------------------------------------------------------------------
output "environment_data_all" {
  value       = data.environment_variables.all
  description = "All environment variables, derived from Epp0/environment provider"
}

output "commadpersistence_cmd_cat_modules_json" {
  value       = commandpersistence_cmd.cat_modules_json.result
  description = "The output of the commandpersistence_cmd resource "
}

