# dotfiles

Dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Install

Install [chezmoi](https://www.chezmoi.io/install/) and [Homebrew](https://brew.sh/), then initialize and apply:

```sh
chezmoi init --apply https://github.com/niebag/dotfiles.git
```

On macOS, `chezmoi apply` installs the Homebrew tools in the Brewfile and the
Herdr integrations for Claude Code and Codex.

## Managed configuration

- Homebrew tools: `herdr`, `jq`, `python`, `tmux`, `fzf`, `ripgrep`, `btop`,
  `chezmoi`, `doctl`, `gh`, `glab`, `hunk`, `k9s`, `mole`, and `terraform`.
- Claude Code and Codex instructions and configuration.
- Agent skills.
- tmux, Ghostty, and helper scripts for terminal workspaces.

For details, see the relevant files in this repository.
