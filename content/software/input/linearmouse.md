---
title: "LinearMouse"
weight: 2
description: "Per-device mouse and trackpad behaviour."
---

{{< lead >}}Disables mouse acceleration, reverses scrolling per device, and remaps buttons.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/linearmouse" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://linearmouse.org/" >}}

## What it does

macOS applies one pointer and scroll policy to everything. LinearMouse sets them **per device**, which resolves the standing annoyance of wanting natural scrolling on the trackpad and inverted scrolling on an external mouse.

It also provides:

- linear pointer tracking with acceleration disabled — what a mouse should do, and what macOS will not offer,
- adjustable scroll speed and line-based versus pixel scrolling,
- button remapping, including side buttons,
- modifier-key actions for scroll gestures.

## Notes

Free and open source. Needs **Accessibility** permission. It does not attempt to be a window manager or a gesture engine — it changes pointer behaviour and stops there.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Mac Mouse Fix](https://macmousefix.com/) | Open source | The other well-known open-source option, with gesture support |
| [SteerMouse](https://plentycom.jp/en/steermouse/) or [USB Overdrive](https://www.usboverdrive.com/) | Paid | Long-standing, per-device configuration |
| [BetterTouchTool](https://folivora.ai/) | Paid | Covers this alongside gestures and window management |
| [Scroll Reverser](https://pilotmoon.com/scrollreverser/) | Open source | If per-device scroll direction is the only thing you need |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask linearmouse
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://linearmouse.org/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://linearmouse.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/linearmouse" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/linearmouse/linearmouse" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
