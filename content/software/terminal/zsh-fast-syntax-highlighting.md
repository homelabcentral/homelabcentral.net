---
title: "zsh-fast-syntax-highlighting"
weight: 24
description: "Syntax highlighting for the Zsh command line."
---

{{< lead >}}Colours the command line as you type — invalid commands turn red before you hit Enter.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/zsh-fast-syntax-highlighting" >}}

## What it does

It highlights the command line live: known commands in one colour, unknown ones in red, quoted strings, paths that exist versus paths that do not, redirections, subshells. A typo or an unclosed quote is visible before the command runs.

"Fast" distinguishes it from `zsh-syntax-highlighting`: it re-highlights incrementally rather than re-parsing the whole buffer on every keystroke, which is what keeps long lines responsive.

```shell
# ~/.zshrc — last of the Zsh plugins
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
```

## Notes

Load it **last**, after completion plugins, or its bindings get overwritten. `fast-theme -l` lists themes.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Open source | The original; simpler, slower on long lines |
| [Fish](https://fishshell.com/) | Open source | Highlights out of the box with nothing installed |
{{< /borderless-table >}}

## Install

```shell
brew install zsh-fast-syntax-highlighting
```

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/zdharma-continuum/fast-syntax-highlighting" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/zsh-fast-syntax-highlighting" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/zdharma-continuum/fast-syntax-highlighting" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
