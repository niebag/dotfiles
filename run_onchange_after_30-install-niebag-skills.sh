#!/bin/sh

# Install the general-purpose skills from niebag/skills via the skills CLI
# (https://skills.sh). The CLI maps agents to their dirs automatically: codex
# and cursor read ~/.agents/skills, so we target those. Claude already gets
# these via its niebag-skills plugin, so we do NOT target claude-code (avoids
# duplicate skills in Claude).
#
# Requires node/npx (managed via nvm); skipped if npx is unavailable at apply
# time. run_onchange: bump the rev below to force a reinstall/update.
#
# rev: 1

set -eu

command -v npx >/dev/null 2>&1 || { echo "npx not found; skipping niebag/skills install" >&2; exit 0; }

npx -y skills add niebag/skills -g -y -a codex cursor
