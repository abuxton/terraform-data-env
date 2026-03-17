---
applyTo: "**/*.{tf,md,yml,py}"
description: "Code Review Standards"
---
# Code Review Standards

Apply the repository-wide guidance from `../copilot-instructions.md` to all code reviews.

## Review Guidelines
- Check for functionality first, then style.
- Ensure no sensitive data is committed.
- Verify documentation matches implementation.
- Ask for tests (integration or unit) if applicable.

## Terraform Specifics
- Check for module variable and output descriptions.
- Check for potential state conflicts.
- Check resource naming conventions.
- Check for unnecessary dependencies.
