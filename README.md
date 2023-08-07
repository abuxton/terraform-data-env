# Terraform module template

[![latest release](https://img.shields.io/github/v/release/telia-oss/terraform-module-template?style=flat-square)](https://github.com/telia-oss/terraform-module-template/releases/latest)
[![build status](https://img.shields.io/github/actions/workflow/status/telia-oss/terraform-module-template/main.yml?branch=master&logo=github&style=flat-square)](https://github.com/telia-oss/terraform-module-template/actions/workflows/main.yml)

Terraform module which creates _describe your intent_ resources on AWS.

## Usage

Use this template to scaffold a new terraform module. Remember to change the following:

- The descriptions and build badges in this [README](README.md).
- Update the [basic](examples/basic/README.md) and [complete](examples/complete/README.md) examples
- Update the [e2e tests](test/).

## Authors

Currently maintained by [these contributors](../../graphs/contributors).

## License

MIT License. See [LICENSE](LICENSE) for full details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_commandpersistence"></a> [commandpersistence](#requirement\_commandpersistence) | 1.1.0 |
| <a name="requirement_environment"></a> [environment](#requirement\_environment) | 1.3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_commandpersistence"></a> [commandpersistence](#provider\_commandpersistence) | 1.1.0 |
| <a name="provider_environment"></a> [environment](#provider\_environment) | 1.3.4 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_helloworld"></a> [helloworld](#module\_helloworld) | briancain/helloworld/aws | 2020.4.21 |

## Resources

| Name | Type |
|------|------|
| [commandpersistence_cmd.cat_modules_json](https://registry.terraform.io/providers/terrycain/commandpersistence/1.1.0/docs/resources/cmd) | resource |
| [terraform_data.test](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [environment_variables.all](https://registry.terraform.io/providers/EppO/environment/1.3.4/docs/data-sources/variables) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_commadpersistence_cmd_cat_modules_json"></a> [commadpersistence\_cmd\_cat\_modules\_json](#output\_commadpersistence\_cmd\_cat\_modules\_json) | The output of the commandpersistence\_cmd resource |
| <a name="output_environment_data_all"></a> [environment\_data\_all](#output\_environment\_data\_all) | All environment variables, derived from Epp0/environment provider |
<!-- END_TF_DOCS -->