---
title: "tmux"
weight: 2
description: "Terminal multiplexer — detachable sessions and panes."
---

{{< lead >}}Keeps shells alive independently of the terminal window attached to them.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/tmux" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/tmux/tmux/releases" >}}

## What it does

tmux runs a server holding sessions; a terminal attaches to one and can detach without killing anything inside. Each session holds windows, each window splits into panes.

The practical payoff for a homelab: SSH into a box, start a long job inside tmux, lose the connection, reattach and it is still running.

```shell
tmux new -s lab        # start a named session
tmux ls                # list sessions
tmux attach -t lab     # reattach
# C-b d detach · C-b % split vertical · C-b " split horizontal
```

## Notes

Pairs with `pam-reattach` on macOS — without it, Touch ID for `sudo` and clipboard access misbehave inside a tmux pane.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Zellij](https://zellij.dev/) | Open source | Friendlier defaults, discoverable keybindings, panes and layouts out of the box |
| [GNU Screen](https://www.gnu.org/software/screen/) | Open source | Older, simpler, usually already installed on a server |
| iTerm2 or WezTerm panes | Open source | Native splits, but they do not survive a lost connection |
| `nohup` or `systemd-run` | Built in | If surviving disconnection is all you need |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install tmux
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Source tarballs](https://github.com/tmux/tmux/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://tmux.github.io/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/tmux" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/tmux/tmux" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/tmux/tmux/wiki" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
