---
title: "GNU Stow"
weight: 15
description: "Symlink farm manager — the classic dotfiles approach."
---

{{< lead >}}Keeps dotfiles in one Git repository and symlinks them into place, one package at a time.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/stow" >}}

## What it does

Stow takes a directory that mirrors the layout of a target tree and creates symlinks for everything in it. For dotfiles that means `~/dotfiles/zsh/.zshrc` becomes `~/.zshrc`, with the real file still under version control.

```shell
cd ~/dotfiles
stow zsh tmux starship   # link these packages into $HOME
stow -D tmux             # unlink one
stow -R zsh              # relink after adding files
```

## Why it holds up

There is no database, no daemon and no custom format — just symlinks and a directory convention. Any machine with `stow` and the repository reproduces the configuration, and `git status` in the repository shows exactly what has drifted.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [chezmoi](https://www.chezmoi.io/) | Open source | Templating, secrets and per-machine differences; the usual choice for complex setups |
| [yadm](https://yadm.io/) | Open source | Git wrapped around `$HOME` directly, no symlinks |
| A bare Git repo with an alias | — | The same as yadm, assembled by hand |
| [dotbot](https://github.com/anishathalye/dotbot) | Open source | A declarative YAML installer instead of a symlink convention |
| [Nix home-manager](https://nix-community.github.io/home-manager/) | Open source | Reproducible to the byte, and a much larger commitment |
{{< /borderless-table >}}

## Install

```shell
brew install stow
```

## Links

{{< cards cols="2" >}}
{{< card link="https://www.gnu.org/software/stow/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/stow" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://www.gnu.org/software/stow/manual/stow.html" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
