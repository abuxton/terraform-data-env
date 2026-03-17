# Terraform Module — Copilot Instructions

## Project Overview
This project is a Terraform module designed to expose module versions in a Terraform run. It uses `epp0/environment` provider and reads local module JSON files.

## Tech Stack
- **Language**: HCL (Terraform)
- **Task Runner**: go-task (Taskfile)
- **Documentation**: terraform-docs
- **CI/CD**: GitHub Actions

## Conventions
- **Naming**: Use `snake_case` for variables, resources, and outputs.
- **Structure**: Follow standard Terraform module layout (`main.tf`, `variables.tf`, `outputs.tf`).
- **State Management**: Use remote backend configurations where applicable.
- **Error Handling**: Use validation blocks in variables where possible.

## Workflow
- **Pull Requests**: Ensure all checks pass (fmt, validate, docs).
- **Commit Messages**: Use semantic commit messages (feat:, fix:, docs:, chore:).
- **Documentation**: Update `README.md` using `terraform-docs` before merging.

## Specific Guidelines
- **Terraform**: See `.github/instructions/terraform.instructions.md`
- **Testing**: See `.github/instructions/testing.instructions.md`
- **Security**: See `.github/instructions/security.instructions.md`
- **Documentation**: See `.github/instructions/documentation.instructions.md`
- **Code Review**: See `.github/instructions/code-review.instructions.md`
