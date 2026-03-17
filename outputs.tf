# ------------------------------------------------------------------------------
# Output
# ------------------------------------------------------------------------------
output "environment_data_all" {
  value       = data.environment_variables.all.items
  description = "All environment variables, derived from Epp0/environment provider"
}

output "modules_json" {
  value       = jsondecode(data.local_file.modules_json.content)
  description = "The content of the modules.json file"
}

# ------------------------------------------------------------------------------
# TFC/TFE Metadata Outputs
# ------------------------------------------------------------------------------

output "workspace_name" {
  value       = try(data.environment_variables.all.items["TFC_WORKSPACE_NAME"], null)
  description = "The name of the Terraform Cloud/Enterprise workspace."
}

output "workspace_slug" {
  value       = try(data.environment_variables.all.items["TFC_WORKSPACE_SLUG"], null)
  description = "The slug of the Terraform Cloud/Enterprise workspace."
}

output "organization" {
  value       = try(data.environment_variables.all.items["TFC_ORG"], null)
  description = "The name of the Terraform Cloud/Enterprise organization."
}

output "run_id" {
  value       = try(data.environment_variables.all.items["TFC_RUN_ID"], null)
  description = "The ID of the Terraform Cloud/Enterprise run."
}

output "project_name" {
  value       = try(data.environment_variables.all.items["TFC_PROJECT_NAME"], null)
  description = "The name of the Terraform Cloud/Enterprise project."
}

output "is_remote" {
  value       = try(data.environment_variables.all.items["TFC_RUN_ID"], "") != ""
  description = "Boolean indicating if the run is executing in Terraform Cloud/Enterprise."
}

# ------------------------------------------------------------------------------
# VCS Metadata Outputs
# ------------------------------------------------------------------------------

output "vcs_commit_sha" {
  value       = try(data.environment_variables.all.items["TFC_CONFIGURATION_VERSION_GIT_COMMIT_SHA"], null)
  description = "The Git commit SHA of the configuration version."
}

output "vcs_branch" {
  value       = try(data.environment_variables.all.items["TFC_CONFIGURATION_VERSION_GIT_BRANCH"], null)
  description = "The Git branch of the configuration version."
}

output "vcs_repo_url" {
  value       = try(data.environment_variables.all.items["TFC_CONFIGURATION_VERSION_GIT_REPO_URL"], null)
  description = "The Git repository URL of the configuration version."
}

# ------------------------------------------------------------------------------
# System Diagnostic Outputs
# ------------------------------------------------------------------------------

output "sys_os_release" {
  value       = try(data.external.sys_info[0].result["os_release"], null)
  description = "The operating system release information of the Terraform runner."
}

output "sys_kernel_version" {
  value       = try(data.external.sys_info[0].result["kernel_version"], null)
  description = "The kernel version of the Terraform runner."
}

output "sys_current_user" {
  value       = try(data.external.sys_info[0].result["current_user"], null)
  description = "The user executing the Terraform run."
}

output "sys_ip_address" {
  value       = try(data.external.sys_info[0].result["ip_address"], null)
  description = "The primary IP address of the Terraform runner."
}

output "sys_disk_usage_root" {
  value       = try(data.external.sys_info[0].result["disk_usage_root"], null)
  description = "Disk usage of the root partition on the runner."
}

output "sys_installed_tools" {
  value       = try(data.external.sys_info[0].result["installed_tools"], null)
  description = "Versions of key tools (git, terraform, jq) installed on the runner."
}

