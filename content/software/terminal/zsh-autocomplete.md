---
title: "zsh-autocomplete"
weight: 22
description: "Real-time type-ahead completion for Zsh."
---

{{< lead >}}Shows completion candidates as you type, without pressing Tab.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/zsh-autocomplete" >}}

## What it does

zsh-autocomplete puts a live completion menu under the prompt as characters are typed — files, commands, options, history — with arrow keys to select and a fuzzy history search bound to the up arrow.

```shell
# ~/.zshrc
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
```

## Notes

It rebinds a lot of keys and overrides much of Zsh's own completion UI, so load order matters: it goes **before** `zsh-fast-syntax-highlighting` and after `compinit`. If completions feel sluggish in a huge repository, `zstyle ':autocomplete:*' min-input 2` cuts most of the cost.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Open source | Much lighter, suggests one inline completion; the far more common choice |
| [fzf-tab](https://github.com/Aloxaf/fzf-tab) | Open source | Replaces Tab completion with an fzf menu, without the live popup |
| [Fish](https://fishshell.com/) | Open source | Has all of this built in, at the cost of not being POSIX-compatible |
{{< /borderless-table >}}

## Install

```shell
brew install zsh-autocomplete
```

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/marlonrichert/zsh-autocomplete" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/zsh-autocomplete" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/marlonrichert/zsh-autocomplete" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
