---
title: "fzf"
weight: 6
description: "General-purpose command-line fuzzy finder."
---

{{< lead >}}Reads lines on stdin, lets you fuzzy-select interactively, writes the choice to stdout.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/fzf" >}}

## What it does

fzf is a filter with a UI. Anything that produces lines can be piped into it, and the selection piped onward — which is why it ends up underneath dozens of other tools' interactive modes.

Its shell integration rebinds three keys: `Ctrl-T` inserts a file path, `Ctrl-R` searches history, and `Alt-C` changes directory. `**<Tab>` completes paths fuzzily.

```shell
# preview a file while selecting it
fzf --preview 'bat --color=always {}'

# check out a branch
git branch -a | fzf | xargs git switch
```

## Notes

Add `eval "$(fzf --zsh)"` to `~/.zshrc` for the key bindings and completion. `FZF_DEFAULT_OPTS` sets layout and preview defaults globally.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [skim](https://github.com/skim-rs/skim) (`sk`) | Open source | A Rust reimplementation with near-identical flags |
| [fzy](https://github.com/jhawthorn/fzy) and [peco](https://github.com/peco/peco) | Open source | Smaller and simpler, fewer features |
| [Telescope](https://github.com/nvim-telescope/telescope.nvim) | Open source | The same idea, but only inside Neovim |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install fzf
```

{{< /tab >}}
{{< tab name="Git clone" >}}

```shell
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://junegunn.github.io/fzf/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/fzf" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/junegunn/fzf" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://junegunn.github.io/fzf/reference/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
