---
title: "iStat Menus"
weight: 1
description: "Comprehensive system monitoring in the menu bar."
---

{{< lead >}}CPU, GPU, memory, disks, network, sensors, battery and weather, all as menu bar items with history graphs.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/istat-menus" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://bjango.com/mac/istatmenus/" >}}

## What it does

iStat Menus puts live readings in the menu bar and detailed history behind each one: per-core CPU, GPU activity, memory pressure and compression, per-disk throughput and SMART status, network throughput with per-process breakdown, every temperature and fan sensor the machine exposes, and battery health with cycle count.

The dropdowns are the real product — clicking the CPU item shows top processes, so "why is this fan on" takes one click rather than opening Activity Monitor.

## Notes

- Paid, with a free trial. A licence covers major versions, not upgrades between them.
- Sensor access needs a helper tool installed with admin rights.
- Overlaps heavily with `btop`, Mx Power Gadget and macmon; the difference is that this one is always visible without opening a terminal.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Stats](https://github.com/exelban/stats) | Open source | Covers most of the same menu bar readouts |
| [iStatistica](https://www.imagetasks.com/istatistica/) or [Sensei](https://cindori.com/sensei) | Paid | A dashboard-first design |
| [MenuMeters](https://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/) | Free | Minimal, long-standing |
| [Activity Monitor](https://support.apple.com/guide/activity-monitor/welcome/mac) | Built in | Enough to answer most questions |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask istat-menus
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://bjango.com/mac/istatmenus/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://bjango.com/mac/istatmenus/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/istat-menus" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://bjango.com/help/istatmenus7/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
