---
title: "zoxide"
weight: 7
description: "A smarter `cd` that learns your most-used directories."
---

{{< lead >}}Jump to a directory by a fragment of its name, ranked by how often and how recently you go there.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/zoxide" >}}

## What it does

zoxide tracks directories you visit and scores them by frequency and recency ("frecency"). `z hextra` jumps to the highest-scoring directory matching that fragment, from anywhere.

```shell
z lab          # jump to the best match
zi lab         # pick from matches interactively (needs fzf)
z -            # previous directory
```

## Notes

Add `eval "$(zoxide init zsh)"` to `~/.zshrc`. `zoxide init zsh --cmd cd` replaces `cd` outright, which is the configuration most people end up at. The database lives in `~/.local/share/zoxide` and can be imported from `z`, `autojump` or `fasd`.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [autojump](https://github.com/wting/autojump) | Open source | The original of this idea, Python-based |
| [z](https://github.com/rupa/z) (rupa) | Open source | A single shell script, no binary to install |
| [fasd](https://github.com/clvv/fasd) | Open source | Tracks files as well as directories, now unmaintained |
| `CDPATH` | Built in | Built into the shell, and enough for a fixed set of project roots |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install zoxide
```

{{< /tab >}}
{{< tab name="Install script" >}}

```shell
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/ajeetdsouza/zoxide" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/zoxide" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/ajeetdsouza/zoxide" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
