---
title: "Mx Power Gadget"
weight: 5
description: "Power and performance monitoring for Apple Silicon."
---

{{< lead >}}Menu bar readout of package power, core frequencies and efficiency-versus-performance core usage.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/mx-power-gadget" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.seense.com/menubarstats/mxpg/" >}}

## What it does

Mx Power Gadget is the Apple Silicon answer to Intel Power Gadget: real-time package and per-domain power draw, separate efficiency and performance core frequencies and utilisation, GPU and ANE activity, and thermal pressure — graphed, from the menu bar.

Its practical use is telling *which kind* of core work landed on. A process pinned to performance cores drains a battery differently from the same work spread across efficiency cores, and nothing in Activity Monitor distinguishes them.

## Notes

Paid, with a trial. Apple Silicon only. Overlaps `macmon`; this one is a GUI and can sit in the menu bar all day, which the terminal tool cannot.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [macmon](/software/monitoring/macmon/) | Open source | Sudoless, the same data in a terminal |
| [asitop](https://github.com/tlkh/asitop) | Open source | Python, over `powermetrics` |
| [iStat Menus](/software/monitoring/istat-menus/) or [Stats](https://github.com/exelban/stats) | Paid / Open source | Broader monitoring, shallower on power specifics |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask mx-power-gadget
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.seense.com/menubarstats/mxpg/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.seense.com/menubarstats/mxpg/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/mx-power-gadget" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
