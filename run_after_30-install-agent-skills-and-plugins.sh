#!/bin/sh

set -eu

if command -v npx >/dev/null 2>&1; then
  npx -y skills add niebag/skills --skill '*' -g -y -a codex
  npx -y skills add JuliusBrussee/caveman --skill '*' -g -y -a codex
  npx -y skills@latest add mattpocock/skills -g -y -a codex --skill \
    ask-matt \
    code-review \
    codebase-design \
    diagnosing-bugs \
    domain-modeling \
    grill-with-docs \
    implement \
    improve-codebase-architecture \
    prototype \
    research \
    resolving-merge-conflicts \
    setup-matt-pocock-skills \
    tdd \
    to-spec \
    to-tickets \
    triage \
    wayfinder \
    grill-me \
    grilling \
    handoff \
    teach \
    to-questionnaire \
    wait-what \
    wizard \
    writing-for-agents
fi

if command -v claude >/dev/null 2>&1; then
  claude plugin marketplace add niebag/skills
  claude plugin marketplace add JuliusBrussee/caveman
  claude plugin marketplace add DietrichGebert/ponytail
  claude plugin marketplace add anthropics/claude-plugins-official
  claude plugin marketplace update

  claude plugin install niebag-skills@niebag-skills
  claude plugin install caveman@caveman
  claude plugin install mattpocock-skills@claude-plugins-official
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
