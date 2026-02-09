#!/usr/bin/env bash
set -euo pipefail

ELAN_HOME="${ELAN_HOME:-$HOME/.elan}"

if ! command -v elan >/dev/null 2>&1; then
  curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y --default-toolchain stable
fi

# Ensure interactive shells resolve elan-managed binaries.
for rc in "$HOME/.profile" "$HOME/.bashrc"; do
  touch "$rc"
  if ! grep -Fq 'export PATH="$HOME/.elan/bin:$PATH"' "$rc"; then
    printf '\nexport PATH="$HOME/.elan/bin:$PATH"\n' >> "$rc"
  fi
done

export PATH="$ELAN_HOME/bin:$PATH"
elan default stable

# Some editor terminals (including non-login shells) may ignore profile files.
# Symlink the elan shims into /usr/local/bin to make lean/lake universally available.
if command -v sudo >/dev/null 2>&1; then
  for tool in elan lean lake leanc leanchecker leanmake leanpkg; do
    if [ -x "$ELAN_HOME/bin/$tool" ]; then
      sudo ln -sf "$ELAN_HOME/bin/$tool" "/usr/local/bin/$tool"
    fi
  done
fi

lean --version
lake --version
