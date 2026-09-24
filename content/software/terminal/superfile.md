---
title: "superfile"
weight: 12
description: "Modern terminal file manager."
---

{{< lead >}}A TUI file manager with panes, a file preview, and an editor-like keymap.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/superfile" >}}

## What it does

superfile is a full-screen file manager for the terminal: multiple panes, fuzzy search, a preview pane for text and images, a processing bar for copies and deletes, bulk rename, and Git status per entry. Keybindings follow Vim conventions by default and are remappable.

It occupies the slot between `cd` plus `ls` and a graphical Finder — useful for moving files around a server over SSH, where Finder is not an option.

## Notes

Configuration and themes live in `~/.config/superfile/`. A Nerd Font is needed for the icons.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [yazi](https://yazi-rs.github.io/) | Open source | The current favourite: asynchronous, image previews, very fast |
| [ranger](https://github.com/ranger/ranger) and [lf](https://github.com/gokcehan/lf) | Open source | The long-standing Vim-style file managers |
| [nnn](https://github.com/jarun/nnn) | Open source | Minimal, tiny, plugin-driven |
| [Midnight Commander](https://midnight-commander.org/) (`mc`) | Open source | Two panes, function keys, unchanged since 1994 and all the better for it |
| [ForkLift](https://binarynights.com/) or [Marta](https://marta.sh/) | Paid | Graphical Finder replacements |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install superfile
```

{{< /tab >}}
{{< tab name="Install script" >}}

```shell
bash -c "$(curl -sLo- https://superfile.dev/install.sh)"
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://superfile.dev/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/superfile" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/yorukot/superfile" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://superfile.dev/configure/superfile-config/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
