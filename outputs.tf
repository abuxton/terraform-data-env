# ------------------------------------------------------------------------------
# Output
# ------------------------------------------------------------------------------
output "environment_data_all" {
  value       = data.environment_variables.all
  description = "All environment variables, derived from Epp0/environment provider"
}

output "modules_json" {
  value       = jsondecode(data.local_file.modules_json.content)
  description = "The content of the modules.json file"
}

