#!/bin/sh

# Install or update the coding-agent CLIs after chezmoi has applied their
# configuration and before the skills installer runs. This is deliberately a
# run_ script, not run_onchange_: `chezmoi apply` is the explicit machine-sync
# action, so it should also bring these CLIs to their latest release.

set -eu

command -v curl >/dev/null 2>&1 || {
  echo "curl not found; skipping coding-agent installation" >&2
  exit 0
}

if command -v claude >/dev/null 2>&1; then
  claude update
else
  curl -fsSL https://claude.ai/install.sh | bash
fi

if command -v codex >/dev/null 2>&1; then
  codex update
else
  curl -fsSL https://chatgpt.com/codex/install.sh | sh
fi

if command -v pi >/dev/null 2>&1; then
  pi update
else
  curl -fsSL https://pi.dev/install.sh | sh
fi

for agent in claude codex pi; do
  if command -v "$agent" >/dev/null 2>&1; then
    printf '%s: %s\n' "$agent" "$("$agent" --version)"
  else
    echo "$agent installed; open a new shell if it is not yet on PATH" >&2
  fi
done
