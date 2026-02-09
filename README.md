# Lean Playground

This repo is configured with a VS Code devcontainer for Lean 4.

## Quick start

1. Open this folder in VS Code.
2. Run **Dev Containers: Reopen in Container**.
3. Wait for `postCreate` to install Lean via `elan`.
4. From a terminal inside the container, run first-time setup:

```bash
lake update
lake exe cache get
```

## Build and run

Run these from the project root (`/workspaces/lean`) inside the container.

1. Build one module (fast feedback):

```bash
lake build Playground.MathlibPlayground
```

2. Build the whole project:

```bash
lake build
```

3. Run the executable:

```bash
lake exe lean-playground
```

## Tooling checks

```bash
lean --version
lake --version
which lean
which lake
```

## If your shell is on the host

Prefix commands with `devcontainer exec`:

```bash
devcontainer exec --workspace-folder . bash -lc 'lake build'
devcontainer exec --workspace-folder . bash -lc 'lake exe lean-playground'
```

## Notes

- Lean toolchain is pinned by `lean-toolchain` (`leanprover/lean4:v4.27.0`).
- `mathlib` is pinned in `lakefile.lean` to `v4.27.0`.
- If you prefer local setup instead of container, install `elan` and run the same `lake` commands.
