#!/bin/sh

# Install or update coding-agent CLIs after chezmoi applies their configuration.

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

for agent in claude codex; do
  if command -v "$agent" >/dev/null 2>&1; then
    printf '%s: %s\n' "$agent" "$("$agent" --version)"
  else
    echo "$agent installed; open a new shell if it is not yet on PATH" >&2
  fi
done
