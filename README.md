# dotfiles

Dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Install

Install [chezmoi](https://www.chezmoi.io/install/) and [Homebrew](https://brew.sh/), then initialize, review, and apply:

```sh
chezmoi init https://github.com/niebag/dotfiles.git
chezmoi diff
chezmoi apply
```

`chezmoi apply` changes only managed configuration.

## Managed configuration

- Homebrew formulae defined in [dot_Brewfile](dot_Brewfile).
- Coding-agent configuration and skills.
- Terminal configuration and workspace helpers.
- One non-overwriting LLM wiki bootstrap at `~/Obsidian/llm-wiki`.

For details, see the relevant files in this repository.
