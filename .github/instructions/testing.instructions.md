---
applyTo: "**/*.tf,**/*.go"
description: "Terraform Testing Guidelines"
---
# Testing Standards

Apply the repository-wide guidance from `../copilot-instructions.md` to all tests.

## General Guidelines
- Validate formatting with `terraform fmt -check`.
- Validate syntax with `terraform validate`.

## Integration Tests
- When possible, write integration tests using Go (Terratest) or similar frameworks.
- Currently, tests are run via `task test-terraform` which checks formatting and validity.
- Ensure that `examples/` directory is valid Terraform code.

## Continuous Integration
- All tests run on GitHub Actions on every push and PR.
- Ensure `copilot-setup-steps.yml` passes cleanly.
