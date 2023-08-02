# ------------------------------------------------------------------------------
# Output
# ------------------------------------------------------------------------------
output "environment_data_all" {
  value       = data.environment_variables.all
  description = "All environment variables, derived from Epp0/environment provider"
}
output "commandpersistence_cmd_terraform_module_versions" {
  value       = commandpersistence_cmd.terraform_module_versions
  description = "The output of the commandpersistence_cmd resource "
}