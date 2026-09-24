---
title: "Atuin"
weight: 5
description: "SQLite-backed shell history with fuzzy search and optional sync."
---

{{< lead >}}Replaces `~/.zsh_history` with a SQLite database you can actually search.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/atuin" >}}

## What it does

Atuin records each command with its exit status, duration, working directory, hostname and session, into SQLite. `Ctrl-R` becomes a full-screen fuzzy search over that, filterable by directory or host.

It also offers end-to-end encrypted sync across machines, either through the hosted server or one you run yourself — for a homelab, self-hosting the sync server is the point.

```shell
atuin import auto     # pull in existing shell history
atuin stats           # what you actually run all day
atuin search --cwd .  # commands run in this directory
```

## Notes

The local database is the source of truth and works with no account at all. Sync is opt-in; `atuin server start` runs your own.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [McFly](https://github.com/cantino/mcfly) | Open source | The other well-known history replacement, with a neural ranking model |
| fzf's `Ctrl-R` widget | Open source | Fuzzy history with nothing extra to run |
| [zsh-histdb](https://github.com/larkery/zsh-histdb) | Open source | SQLite history without the sync service |
| `HISTSIZE` plus `setopt HIST_IGNORE_DUPS` | Built in | Better than the defaults |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install atuin
```

{{< /tab >}}
{{< tab name="Install script" >}}

```shell
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://atuin.sh/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/atuin" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/atuinsh/atuin" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://docs.atuin.sh/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
