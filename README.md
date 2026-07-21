# dotfiles

Personal dotfiles, managed with [chezmoi](https://www.chezmoi.io/).

## Install on a new machine

Install [chezmoi](https://www.chezmoi.io/install/), then initialize and apply these dotfiles:

```sh
chezmoi init --apply https://github.com/niebag/dotfiles.git
```

## Requirements & what `apply` does (macOS)

- Requires [Homebrew](https://brew.sh/). On `apply` (before writing files),
  `run_onchange_before_10-install-packages.sh` runs `brew bundle` from
  `dot_Brewfile` to install the tools the dotfiles depend on (herdr, jq,
  python, tmux, fzf, ripgrep).
- `run_onchange_install-herdr-integrations.sh` then runs
  `herdr integration install` for Claude Code and Codex (herdr owns those hooks,
  so they are not tracked here). It re-runs automatically on herdr upgrades.
- `dot_codex/modify_private_config.toml` creates a small Python venv at
  `~/.cache/dotfiles/venv` (with `tomlkit`) to edit `~/.codex/config.toml`
  in place.
- Non-macOS: the Homebrew steps no-op; install the tools yourself.
