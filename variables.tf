variable "demo_module_bool" {
  type        = bool
  default     = false
  description = "(Optional) Boolean whether to use demo module or not"
}

variable "enable_debug_provisioners" {
  type        = bool
  default     = false
  description = "(Optional) Enable debug local-exec provisioners for system discovery. WARNING: This runs commands that capture environment variables and host diagnostics and may leak secrets or other sensitive runtime details into CI/Terraform Cloud logs. Use only for temporary troubleshooting and disable afterwards."
}

variable "enable_system_info" {
  type        = bool
  default     = false
  description = "(Optional) Enable external data source to fetch system information."
}
  