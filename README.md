# Terraform Data Environment Module

This module exposes Terraform Cloud/Enterprise (TFC/TFE) environment data, module versions, and runtime system diagnostics. It is designed to provide context for governance (Sentinel/OPA), debugging, and dynamic Terraform logic.

## Features

- **TFC/TFE Metadata**: Exposes workspace name, ID, slug, project name, organization, and run ID as structured outputs.
- **VCS Information**: Provides Git commit SHA, branch, and repository URL if available in the environment.
- **Module Inspection**: Reads `.terraform/modules/modules.json` to expose version information of installed modules for policy enforcement.
- **System Diagnostics** (Optional): Fetches runtime information about the Terraform runner (OS, kernel, user, disk usage, installed tools) using an external data source.

## Usage

```hcl
module "data_env" {
  source = "abuxton/terraform-data-env"

  # Optional Feature Flags
  enable_system_info        = true  # Enable external data source for system diagnostics
  enable_debug_provisioners = false # Enable local-exec echo commands for debugging
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `enable_system_info` | Enable external data source to fetch system information (OS, IP, Disk, etc). | `bool` | `false` |
| `enable_debug_provisioners` | Enable debug `local-exec` provisioners that print system info to stdout. | `bool` | `false` |
| `demo_module_bool` | Boolean whether to use demo module or not. | `bool` | `false` |

## Outputs

### TFC/TFE Metadata
- `workspace_name`, `workspace_slug`, `organization`
- `project_name`, `run_id`
- `is_remote`: Boolean indicating if running in TFC/TFE.

### VCS Metadata
- `vcs_commit_sha`
- `vcs_branch`
- `vcs_repo_url`

### System Diagnostics (Requires `enable_system_info = true`)
- `sys_os_release`: OS version of the runner.
- `sys_kernel_version`: Kernel version.
- `sys_current_user`: User executing the run (e.g., `tfc-agent`).
- `sys_ip_address`: Primary IP address.
- `sys_disk_usage_root`: Disk usage of `/`.
- `sys_installed_tools`: Versions of git, terraform, and jq.

### Module Data
- `modules_json`: Raw content of `.terraform/modules/modules.json`.
- `environment_data_all`: All environment variables (raw map).

## Governance & Policy Usage

The exposed data is particularly useful for Sentinel or OPA policies.

**Example: Sentinel Mock Data**
The module exposes structure that can be used to mock state for policy checks:

```json
"modules_json": {
  "value": {
    "Modules": [
      {
        "Key": "helloworld",
        "Source": "registry.terraform.io/briancain/helloworld/aws",
        "Version": "2020.4.21"
      }
    ]
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| Terraform | ~> 1.9 |
| epp0/environment | ~> 1.3 |


### Copilot & Agents
This project includes configuration for GitHub Copilot.
- See **[AGENTS.md](AGENTS.md)** for detailed development workflows, setup instructions, and release processes.
- See **`.github/copilot-instructions.md`** for coding standards and agent personas used in this repository.

#### Skills

a `skills-lock.json` is included run `npx -yes skills experimental_install -p -y` to reinstall the implied agent skills for the project.

## Authors

Currently maintained by [these contributors](../../graphs/contributors).

## License

MIT License. See [LICENSE](LICENSE) for full details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_environment"></a> [environment](#requirement\_environment) | ~> 1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_environment"></a> [environment](#provider\_environment) | ~> 1.3 |
| <a name="provider_external"></a> [external](#provider\_external) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_helloworld"></a> [helloworld](#module\_helloworld) | briancain/helloworld/aws | ~> 2020.4 |

## Resources

| Name | Type |
|------|------|
| [terraform_data.test](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [environment_variables.all](https://registry.terraform.io/providers/EppO/environment/latest/docs/data-sources/variables) | data source |
| [external_external.sys_info](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [local_file.modules_json](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_demo_module_bool"></a> [demo\_module\_bool](#input\_demo\_module\_bool) | (Optional) Boolean whether to use demo module or not | `bool` | `false` | no |
| <a name="input_enable_debug_provisioners"></a> [enable\_debug\_provisioners](#input\_enable\_debug\_provisioners) | (Optional) Enable debug local-exec provisioners for system discovery. | `bool` | `false` | no |
| <a name="input_enable_system_info"></a> [enable\_system\_info](#input\_enable\_system\_info) | (Optional) Enable external data source to fetch system information. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_environment_data_all"></a> [environment\_data\_all](#output\_environment\_data\_all) | All environment variables, derived from Epp0/environment provider |
| <a name="output_is_remote"></a> [is\_remote](#output\_is\_remote) | Boolean indicating if the run is executing in Terraform Cloud/Enterprise. |
| <a name="output_modules_json"></a> [modules\_json](#output\_modules\_json) | The content of the modules.json file |
| <a name="output_organization"></a> [organization](#output\_organization) | The name of the Terraform Cloud/Enterprise organization. |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | The name of the Terraform Cloud/Enterprise project. |
| <a name="output_run_id"></a> [run\_id](#output\_run\_id) | The ID of the Terraform Cloud/Enterprise run. |
| <a name="output_sys_current_user"></a> [sys\_current\_user](#output\_sys\_current\_user) | The user executing the Terraform run. |
| <a name="output_sys_disk_usage_root"></a> [sys\_disk\_usage\_root](#output\_sys\_disk\_usage\_root) | Disk usage of the root partition on the runner. |
| <a name="output_sys_installed_tools"></a> [sys\_installed\_tools](#output\_sys\_installed\_tools) | Versions of key tools (git, terraform, jq) installed on the runner. |
| <a name="output_sys_ip_address"></a> [sys\_ip\_address](#output\_sys\_ip\_address) | The primary IP address of the Terraform runner. |
| <a name="output_sys_kernel_version"></a> [sys\_kernel\_version](#output\_sys\_kernel\_version) | The kernel version of the Terraform runner. |
| <a name="output_sys_os_release"></a> [sys\_os\_release](#output\_sys\_os\_release) | The operating system release information of the Terraform runner. |
| <a name="output_vcs_branch"></a> [vcs\_branch](#output\_vcs\_branch) | The Git branch of the configuration version. |
| <a name="output_vcs_commit_sha"></a> [vcs\_commit\_sha](#output\_vcs\_commit\_sha) | The Git commit SHA of the configuration version. |
| <a name="output_vcs_repo_url"></a> [vcs\_repo\_url](#output\_vcs\_repo\_url) | The Git repository URL of the configuration version. |
| <a name="output_workspace_name"></a> [workspace\_name](#output\_workspace\_name) | The name of the Terraform Cloud/Enterprise workspace. |
| <a name="output_workspace_slug"></a> [workspace\_slug](#output\_workspace\_slug) | The slug of the Terraform Cloud/Enterprise workspace. |
<!-- END_TF_DOCS -->
