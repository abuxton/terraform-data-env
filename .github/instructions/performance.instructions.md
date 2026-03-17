---
applyTo: "**/*.tf"
description: "Performance Guidelines"
---
# Performance Guidelines

Apply the repository-wide guidance from `../copilot-instructions.md` to all code.

## Terraform Performance
- Use `parallelism` flags when running apply if needed (default is 10).
- Avoid excessive `remote-exec` or `local-exec` provisioners.
- Use module sources that are versioned to avoid re-downloading.
- Keep state files small by splitting large configurations.
