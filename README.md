# dotfiles

Dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Install

Install [chezmoi](https://www.chezmoi.io/install/) and [Homebrew](https://brew.sh/), then initialize and apply:

```sh
chezmoi init --apply https://github.com/niebag/dotfiles.git
```

On macOS, `chezmoi apply` installs the Homebrew dependencies, configures
coding-agent integrations, and refreshes agent CLIs and skills.

## Managed configuration

- Homebrew formulae defined in [dot_Brewfile](dot_Brewfile).
- Coding-agent configuration, integrations, and skills.
- Terminal configuration and workspace helpers.
- LLM wiki vault skeletons and instructions.

For details, see the relevant files in this repository.
