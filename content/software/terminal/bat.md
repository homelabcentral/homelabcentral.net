---
title: "bat"
weight: 9
description: "`cat` with syntax highlighting, line numbers and Git integration."
---

{{< lead >}}A `cat` clone that highlights syntax, shows Git modifications in the gutter, and pages automatically.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/bat" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/sharkdp/bat/releases" >}}

## What it does

bat prints files with syntax highlighting for a few hundred languages, line numbers, a header, and `+`/`~`/`-` markers in the gutter for Git-tracked changes. Output longer than a screen goes through a pager; piped output is plain, so `bat file | grep x` still behaves.

```shell
bat hugo.yaml
bat -r 40:80 Makefile      # line range
bat --diff                  # only changed lines
```

## Wiring it in

```shell
export MANPAGER="sh -c 'sed -e s/.\\[[0-9]*m//g | bat -p -l man'"
alias cat='bat --paging=never'
```

`bat --list-themes` shows the themes; `--theme` or `BAT_THEME` selects one.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| `cat` | Built in | The right tool when the output is being piped |
| `less -R` | Built in | Paging with colour, no syntax highlighting |
| `pygmentize` | — | Highlighting via Python, slower, more languages |
| `delta` | Open source | The same author's sibling idea applied to `git diff` |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install bat
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Binaries on GitHub Releases](https://github.com/sharkdp/bat/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/sharkdp/bat" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/bat" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/sharkdp/bat" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
