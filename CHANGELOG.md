# Changelog

All notable changes to this project will be documented in this file.

## [0.1.0] - 2026-03-17

### Added

- **System Diagnostics**: Added ability to collect and output runtime system information (OS, Kernel, User, IP, Disk Usage, Tool Versions) via a new `external` data source. Controlled by input `enable_system_info` (default: `false`).
- **TFC/TFE Metadata**: Exposed structured outputs for Terraform Cloud/Enterprise environment variables: `workspace_name`, `workspace_slug`, `organization`, `project_name`, `run_id`, `is_remote`.
- **VCS Integration**: Added outputs for Version Control System metadata: `vcs_commit_sha`, `vcs_branch`, `vcs_repo_url`.
- **Debug Capabilities**: Added optional `local-exec` provisioners to `terraform_data` resource for debugging runtime environments. Controlled by input `enable_debug_provisioners` (default: `false`).
- **Copilot Configuration**: Added comprehensive GitHub Copilot configuration in `.github/` including instructions, skills (`create-module`, `debug-terraform`, etc.), and agent definitions.
- **AGENTS.md**: Added project documentation for agents and developers.
- **Workflows**: Added `.github/workflows/copilot-setup-steps.yml` for automated environment setup.

### Changed

- Updated `README.md` with new features and usage instructions.
