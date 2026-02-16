# Maven Repository

This repository was initialized without any visible source files.

## Bug fixed

A root-level `.gitkeep` file was the only tracked file, which made the repository appear empty to common file-discovery tooling (for example, `rg --files` ignores hidden files by default). That can hide accidental empty checkouts and break simple automation.

This commit adds a repository health check script and removes the root placeholder so empty-repo states are detected quickly.

## Validate

```bash
./scripts/verify-repo-has-visible-files.sh
```
