---
applyTo: "**/*.md"
description: "Documentation Standards"
---
# Documentation Guidelines

Apply the repository-wide guidance from `../copilot-instructions.md` to all documentation.

## General Guidelines
- All modules must have a `README.md`.
- `README.md` should be generated using `terraform-docs`.
- Provide usage examples in `examples/` directory.

## Format
- Use Markdown for all documentation.
- Keep the `README.md` updated with variable descriptions and outputs.
- Ensure URLs in documentation are correct and accessible.

## Tools
- `terraform-docs` is configured via `.terraform-docs.yml`.
- Run `task terraform-docs` to update documentation.
