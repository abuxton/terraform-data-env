# Terraform data env

This module is created to expose the module versions in a Terraform run. 

The epp0/environment provider is used to allow you to go splunking through run and environment data.

The main contribution, is a use of the terraform local resource to pull the `./terraform/modules/modules.json` file content as json data that can be utilised with policy enforcement and other features.


## Usage

see [examples](https://github.com/abuxton/terraform-data-env/blob/0.0.5/examples/) folder and [default example](https://github.com/abuxton/terraform-data-env/blob/0.0.5/examples/default/README.md)

### Sentinel usage

the data is exposed as an out put in mock-tfstate-v2.sentinel

```json
outputs = {
    ...
"modules_json": {
		"name":      "modules_json",
		"sensitive": false,
		"value": {
			"Modules": [
                ...
				{
					"Dir":     ".terraform/modules/helloworld",
					"Key":     "helloworld",
					"Source":  "registry.terraform.io/briancain/helloworld/aws",
					"Version": "2020.4.21",
				},

```

while the mock-tfconfig-v2.sentinel only shows the constraint not the actual module

```json

module_calls = {
...
        "source":             "briancain/helloworld/aws",
		"version_constraint": "> 2020.3",
	},

```
worth noting the raw data is also available in the local resource which parses the file, but that is a much more complex structure to operate over.

## Authors

Currently maintained by [these contributors](https://github.com/abuxton/terraform-data-env/graphs/contributors).

## License

MIT License. See [LICENSE](https://github.com/abuxton/terraform-data-env/blob/0.0.5/LICENSE) for full details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_environment"></a> [environment](#requirement\_environment) | 1.3.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_environment"></a> [environment](#provider\_environment) | 1.3.8 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_helloworld"></a> [helloworld](#module\_helloworld) | briancain/helloworld/aws | > 2020.3 |

## Resources

| Name | Type |
|------|------|
| [terraform_data.test](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [environment_variables.all](https://registry.terraform.io/providers/EppO/environment/1.3.8/docs/data-sources/variables) | data source |
| [local_file.modules_json](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_demo_module_bool"></a> [demo\_module\_bool](#input\_demo\_module\_bool) | (Optional) Boolean whether to use demo module or not | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_environment_data_all"></a> [environment\_data\_all](#output\_environment\_data\_all) | All environment variables, derived from Epp0/environment provider |
| <a name="output_modules_json"></a> [modules\_json](#output\_modules\_json) | The content of the modules.json file |
<!-- END_TF_DOCS -->