# Lean Playground

This repo is configured with a VS Code devcontainer for Lean 4.

## Quick start

1. Open this folder in VS Code.
2. Run **Dev Containers: Reopen in Container**.
3. Wait for `postCreate` to install Lean via `elan`.
4. Build and run:

```bash
lake build
lake exe lean-playground
```

## Notes

- Lean toolchain is pinned by `lean-toolchain` (`stable`).
- If you prefer local setup instead of container, install `elan` and run the same `lake` commands.
