# AGENTS.md

## Project Overview

This is a Terraform module designed to expose module versions in a Terraform run. It utilizes the `epp0/environment` provider to access run and environment data, and pulls content from `.terraform/modules/modules.json` for policy enforcement.

**Key Features:**
- Exposes module versions as outputs.
- Uses `epp0/environment` provider.
- Helps with Sentinel policy checks.

## Setup Commands

- Install Terraform: Ensure Terraform ~> 1.9 is installed.
- Install Task (go-task): `brew install go-task/tap/go-task` (or relevant package manager).
- Install terraform-docs: `brew install terraform-docs` (or relevant package manager).
- Install GitHub CLI: `brew install gh` (required for release tasks).
- Python 3 is required for the release process.

## Development Workflow

We use `Taskfile` to manage development tasks. Run `task` to see all available commands.

- List tasks: `task` or `task --list-all`
- Clean environment: `task clean` (removes `.terraform` directories and lock files)

## Testing Instructions

Tests validate Terraform configuration and formatting.

- Run all tests: `task test`
- Run Terraform tests specifically: `task test-terraform`
  - This runs `terraform fmt`, `terraform init`, and `terraform validate` across all directories.
- Note: There is a `test-go` task, but currently no Go files are in the repository.

## Code Style

- Format code: `task test-terraform` (includes `terraform fmt` check).
- Update documentation: `task terraform-docs`
  - Requires `.terraform-docs.yml`. Generate config with `task generate-terraform-docs-config` if missing.

## Release Process

Automated release process using `task release`.

- Prerequisites: `gh` CLI installed, `MOD_RELEASE` environment variable set.
- Command: `MOD_RELEASE=x.y.z task release`
- This creates a release branch, updates documentation, tags the release, and creates a GitHub release.

## Additional Notes

- The project structure follows standard Terraform module layout.
- Examples are located in `examples/`.
- `main.tf`, `variables.tf`, `outputs.tf` are the core module files.
