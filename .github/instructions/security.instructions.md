---
applyTo: "**/*.tf,**/*.hcl"
description: "Security Guidelines"
---
# Security Guidelines

Apply the repository-wide guidance from `../copilot-instructions.md` to all code.

## General Guidelines
- Do not hardcode credentials. Use `variables` and `tfvars` files.
- Be cautious with sensitive outputs. Mark outputs as sensitive if they contain secrets.
- Use IAM roles and policies with least privilege.

## Terraform-Specific
- Avoid `count = var.enabled ? 1 : 0` for resources that contain secrets if possible, use `for_each` or separate modules.
- Be careful with `local-exec` provisioning.
- Use `tfsec` or `checkov` (if available) for security scanning.
