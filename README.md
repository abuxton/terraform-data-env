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

### Copilot & Agents
This project includes configuration for GitHub Copilot.
- See **[AGENTS.md](AGENTS.md)** for detailed development workflows, setup instructions, and release processes.
- See **`.github/copilot-instructions.md`** for coding standards and agent personas used in this repository.

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

## Authors

Currently maintained by [these contributors](../../graphs/contributors).

## License

MIT License. See [LICENSE](LICENSE) for full details.
