#!/bin/sh

set -eu

command -v curl >/dev/null 2>&1 || {
  echo "curl not found; skipping Codex installation" >&2
  exit 0
}

if command -v codex >/dev/null 2>&1; then
  codex update
else
  curl -fsSL https://chatgpt.com/codex/install.sh | sh
fi

codex --version
