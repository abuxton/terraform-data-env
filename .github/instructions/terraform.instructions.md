---
applyTo: "**/*.tf,**/*.hcl"
description: "Terraform Module Development Guidelines"
---
# Terraform Coding Standards

Apply the repository-wide guidance from `../copilot-instructions.md` to all Terraform files.

## General Guidelines
- Use data sources where possible to avoid hardcoded values.
- Keep module structure flat unless submodules are necessary.
- Use `locals` for complex expressions to improve readability.
- Prefer `for_each` over `count` for resources that might be removed from the middle of a list.

## Naming Conventions
- Resources: `resource_type.logical_name` (e.g., `aws_s3_bucket.logs`)
- Variables: `variable_name` (snake_case)
- Outputs: `output_name` (snake_case)

## Module Composition
- Use data sources to fetch information about existing resources.
- Use `depends_on` only when implicit dependencies are not sufficient.
- Avoid using `provisioner "local-exec"` unless absolutely necessary.
