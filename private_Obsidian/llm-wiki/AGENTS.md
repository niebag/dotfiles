# LLM wiki

This is the only LLM wiki. Its root is `~/Obsidian/llm-wiki`.

## Structure

| Path | Owner |
| --- | --- |
| `raw/` | Human-owned source material. The agent reads it but does not modify it, except moving processed inbox files and creating conversation sources. |
| `wiki/` | Agent-owned knowledge pages. |
| `AGENTS.md` | These rules. |

Use `raw/inbox/` for unprocessed material, `raw/ingested/` for processed material, and `raw/assets/` for images. Never move assets.

Keep `wiki/` flat until a group has at least three pages. Maintain `wiki/index.md` and append each operation to `log.md`.

## Working rules

Read this file before any wiki task. Work only in this vault.

For every source-backed wiki page, keep a `source:` field in frontmatter and a visible body link to the source. For non-Markdown sources, create a stub in `wiki/sources/`.

Do not overwrite or remove human-owned raw material. Ask when source handling or wiki placement is unclear.
