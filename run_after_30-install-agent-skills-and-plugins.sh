#!/bin/sh

set -eu

if command -v npx >/dev/null 2>&1; then
  npx -y skills add niebag/skills --skill '*' -g -y -a codex
  npx -y skills add JuliusBrussee/caveman --skill '*' -g -y -a codex
  npx -y skills@latest add mattpocock/skills --skill '*' -g -y -a codex
fi

if command -v codex >/dev/null 2>&1; then
  codex plugin marketplace add DietrichGebert/ponytail
  codex plugin marketplace upgrade ponytail
  codex plugin add ponytail@ponytail
fi
