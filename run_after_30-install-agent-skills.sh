#!/bin/sh

set -eu

if command -v npx >/dev/null 2>&1; then
  npx -y skills add herdrdev/herdr --skill herdr --agent codex --global --yes
else
  echo "npx not on PATH; skipping herdr skill" >&2
fi

if command -v hunk >/dev/null 2>&1; then
  mkdir -p "$HOME/.agents/skills"
  ln -sfn "$(dirname "$(hunk skill path)")" "$HOME/.agents/skills/hunk-review"
else
  echo "hunk not on PATH; skipping hunk skill" >&2
fi
