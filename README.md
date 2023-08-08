# Terraform data env

This module is created to expose the module versions in a Terraform run. 

The epp0/environment provider is used to allow you to go splunking through run and environment data.

The main contribution, is a use of the terraform local resource to pull the `./terraform/modules/modules.json` file contant has json data that can be utilised

## Usage



## Authors

Currently maintained by [these contributors](../../graphs/contributors).

## License

MIT License. See [LICENSE](LICENSE) for full details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_environment"></a> [environment](#requirement\_environment) | 1.3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_environment"></a> [environment](#provider\_environment) | 1.3.4 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_helloworld"></a> [helloworld](#module\_helloworld) | briancain/helloworld/aws | 2020.4.21 |

## Resources

| Name | Type |
|------|------|
| [terraform_data.test](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [environment_variables.all](https://registry.terraform.io/providers/EppO/environment/1.3.4/docs/data-sources/variables) | data source |
| [local_file.modules_json](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_environment_data_all"></a> [environment\_data\_all](#output\_environment\_data\_all) | All environment variables, derived from Epp0/environment provider |
| <a name="output_modules_json"></a> [modules\_json](#output\_modules\_json) | The content of the modules.json file |
<!-- END_TF_DOCS -->