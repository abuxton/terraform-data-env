module "terraform_data_env" {
  source           = "../.."
  demo_module_bool = true
}

output "terraform_module_versions" {
  value       = module.terraform_data_env.modules_json
  description = "The versions of the modules used in this configuration"
}