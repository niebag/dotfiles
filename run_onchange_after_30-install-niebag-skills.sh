#!/bin/sh

# Install the general-purpose skills from niebag/skills for every harness.
#
# - Codex & Cursor read ~/.agents/skills, so the skills CLI (https://skills.sh)
#   installs there. The CLI maps agents to their dirs automatically; we do NOT
#   target claude-code with it (Claude gets these via the plugin below, so that
#   would duplicate them).
# - Claude Code gets them via its plugin marketplace instead: add + install the
#   niebag-skills plugin, then refresh the marketplace and update the plugin to
#   the latest revision (install alone is idempotent and never upgrades). All
#   four commands are idempotent.
#
# Each tool's step is guarded and skipped if its CLI is absent (npx needs
# node/nvm; claude is the Claude Code CLI). `npx skills add` re-copies the latest
# skills on every run, so Codex/Cursor need no separate update step.

set -eu

if command -v npx >/dev/null 2>&1; then
  npx -y skills add niebag/skills -g -y -a codex cursor
else
  echo "npx not found; skipping niebag/skills install for Codex/Cursor" >&2
fi

if command -v claude >/dev/null 2>&1; then
  claude plugin marketplace add niebag/skills
  claude plugin install niebag-skills@niebag-skills
  claude plugin marketplace update niebag-skills
  claude plugin update niebag-skills@niebag-skills
else
  echo "claude not found; skipping niebag-skills plugin install for Claude Code" >&2
fi
