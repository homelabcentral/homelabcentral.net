---
title: "zsh-completions"
weight: 23
description: "Extra completion definitions for Zsh."
---

{{< lead >}}Completion scripts for hundreds of commands Zsh does not ship definitions for.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/zsh-completions" >}}

## What it does

A community collection of `_command` completion functions — cloud CLIs, package managers, build tools, language toolchains — that Zsh's bundled set does not cover. Installing it is a matter of putting its directory on `fpath` before `compinit` runs.

```shell
# ~/.zshrc, before compinit
FPATH="/opt/homebrew/share/zsh-completions:$FPATH"
autoload -Uz compinit && compinit
```

## Notes

If completions stop updating after an install, the cache is stale: `rm -f ~/.zcompdump*` and start a new shell.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [oh-my-zsh](https://ohmyz.sh/) or [prezto](https://github.com/sorin-ionescu/prezto) | Open source | Frameworks that bundle these completions among much else |
| [zinit](https://github.com/zdharma-continuum/zinit) or [antidote](https://antidote.sh/) | Open source | Plugin managers that can load them on demand |
| [Fish](https://fishshell.com/) | Open source | Generates completions from man pages automatically |
{{< /borderless-table >}}

## Install

```shell
brew install zsh-completions
```

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/zsh-users/zsh-completions" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/zsh-completions" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/zsh-users/zsh-completions" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
