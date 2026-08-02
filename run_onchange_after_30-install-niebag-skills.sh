#!/bin/sh

# Install niebag skills with npx for Codex and Claude's plugin system.

set -eu

if command -v npx >/dev/null 2>&1; then
  npx -y skills add niebag/skills -g -y -a codex
else
  echo "npx not found; skipping niebag/skills install for Codex" >&2
fi

if command -v claude >/dev/null 2>&1; then
  claude plugin marketplace add niebag/skills
  claude plugin install niebag-skills@niebag-skills
  claude plugin marketplace update niebag-skills
  claude plugin update niebag-skills@niebag-skills
else
  echo "claude not found; skipping niebag-skills plugin install for Claude Code" >&2
fi
