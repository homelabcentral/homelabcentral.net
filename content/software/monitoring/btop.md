---
title: "btop"
weight: 2
description: "Resource monitor for the terminal."
---

{{< lead >}}The best-looking process and resource monitor that runs over SSH.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/btop" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/aristocratos/btop/releases" >}}

## What it does

btop shows CPU (total and per-core, with a scrolling graph), memory, disks, network throughput and a process tree, all mouse- and keyboard-navigable in a terminal. Processes can be filtered, sorted, signalled and inspected without leaving it.

Because it is a terminal application, the same tool works on a headless server over SSH — which is why it ends up preferred to any GUI monitor in a lab.

```shell
btop
btop --preset 1       # a saved layout
# f filter · t tree view · + / - expand · k signal
```

## Notes

Configuration is `~/.config/btop/btop.conf`, and themes go in `themes/` beside it. Needs a terminal with true-colour support, which iTerm2 has.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [htop](/software/monitoring/htop/) | Open source | Plainer, faster to start, present on practically every Unix machine |
| [bottom](https://github.com/ClementTsang/bottom) (`btm`) | Open source | A Rust alternative with a very similar layout |
| [glances](https://nicolargo.github.io/glances/) | Open source | Adds a web UI and remote monitoring over the same data |
| [Activity Monitor](https://support.apple.com/guide/activity-monitor/welcome/mac) | Built in | The graphical answer, if you are not over SSH |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install btop
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Binaries on GitHub Releases](https://github.com/aristocratos/btop/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/aristocratos/btop" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/btop" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/aristocratos/btop" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
