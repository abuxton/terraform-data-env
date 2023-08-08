module "terraform_data_env" {
  source           = "../.."
  demo_module_bool = true
}

output "terraform_module_versions" {
  value       = module.terraform_data_env.terraform_module_versions
  description = "The versions of the modules used in this configuration"
}