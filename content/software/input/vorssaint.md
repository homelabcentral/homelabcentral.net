---
title: "Vorssaint"
weight: 8
description: "Menu bar toolkit: audio, monitoring, windows, mouse and clipboard."
---

{{< lead >}}One menu bar icon covering per-app volume, system monitoring, window snapping, mouse fixes, clipboard history and keep-awake.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/vorssaint" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://vorssaint.com" >}}

## What it does

Vorssaint is a suite rather than a utility. The groups it ships are audio (per-app volume with a mixer, boost past 100%, output switching, microphone mute), monitoring (CPU, GPU, memory, temperatures, battery health, fans, network, with menu bar readouts and alerts), windows and Dock (app switcher with previews, snapping, Dock hover previews, quit-on-close), keyboard and mouse (snippet expansion, smooth and linear scrolling, acceleration off, side buttons, key debounce), and clipboard (searchable history, paste as plain text, auto-clear).

The reason to care is the overlap: most of that list is a separate paid app elsewhere, and running six of those means six launch agents, six update checkers and six menu bar icons. It is also the reason to be careful — a suite this wide touches Accessibility, screen recording and input monitoring, and a single app holding all of those permissions is a bigger surface than one that holds one.

It needs Apple Silicon and a recent macOS; the project is GPL-3.0 and local-first, with no account.

## Notes

- Features are individually switchable, so it can be run as one thing — just the volume mixer, say — rather than all of it.
- It covers ground held by [LinearMouse](/software/input/linearmouse/), [Vanilla](/software/input/vanilla/), [Amphetamine](/software/input/amphetamine/) and [iStat Menus](/software/monitoring/istat-menus/). Each of those is better at its one job; this is the trade.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [iStat Menus](/software/monitoring/istat-menus/) | Paid | Deeper sensor coverage, and monitoring only |
| [LinearMouse](/software/input/linearmouse/) | Open source | Per-device mouse behaviour, nothing else |
| [Amphetamine](/software/input/amphetamine/) | Free | Keep-awake only, with far better triggers |
| [Rectangle](https://rectangleapp.com/) | Open source | Window snapping only |
| [Raycast](https://www.raycast.com/) | Freemium | Clipboard history and snippets inside a launcher |
| [Bartender](https://www.macbartender.com/) | Freemium | Menu bar control, which this does not do |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask vorssaint
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the project site](https://vorssaint.com) or the [GitHub releases page](https://github.com/vorssaint/vorssaint-utils/releases).

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://vorssaint.com" title="vorssaint.com" icon="globe-alt" subtitle="Official site and feature list" >}}
{{< card link="https://formulae.brew.sh/cask/vorssaint" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/vorssaint/vorssaint-utils" title="vorssaint/vorssaint-utils" icon="github" subtitle="Source and releases, GPL-3.0" >}}
{{< /cards >}}
