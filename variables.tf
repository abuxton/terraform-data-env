variable "demo_module_bool" {
  type        = bool
  default     = false
  description = "(Optional) Boolean whether to use demo module or not"
}

variable "enable_debug_provisioners" {
  type        = bool
  default     = false
  description = "(Optional) Enable debug local-exec provisioners for system discovery."
}

variable "enable_system_info" {
  type        = bool
  default     = false
  description = "(Optional) Enable external data source to fetch system information."
}
  