#!/bin/sh

set -eu

if command -v npx >/dev/null 2>&1; then
  npx -y skills add niebag/skills -g -y -a codex
  npx -y skills add JuliusBrussee/caveman -g -y -a codex
fi

if command -v claude >/dev/null 2>&1; then
  claude plugin marketplace add niebag/skills
  claude plugin marketplace add JuliusBrussee/caveman
  claude plugin marketplace add DietrichGebert/ponytail
  claude plugin marketplace update

  claude plugin install niebag-skills@niebag-skills
  claude plugin install caveman@caveman
  claude plugin install ponytail@ponytail

  claude plugin update niebag-skills@niebag-skills
  claude plugin update caveman@caveman
  claude plugin update ponytail@ponytail
fi

if command -v codex >/dev/null 2>&1; then
  codex plugin marketplace add DietrichGebert/ponytail
  codex plugin marketplace upgrade ponytail
  codex plugin add ponytail@ponytail
fi
