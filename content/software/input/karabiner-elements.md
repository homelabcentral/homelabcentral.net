---
title: "Karabiner-Elements"
weight: 1
description: "Deep keyboard customisation at the driver level."
---

{{< lead >}}Remaps any key to any key, builds layers, and applies different rules per keyboard.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/karabiner-elements" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://karabiner-elements.pqrs.org/" >}}

## What it does

Karabiner-Elements sits below the application layer, so its remappings apply everywhere including login and recovery-adjacent contexts. Beyond simple swaps it supports:

- **Complex modifications** — conditional rules with JSON definitions, per-application or per-device.
- **Layers** — hold a key to turn the alphabet into arrows, media keys or symbols.
- **Simultaneous keys** and **tap versus hold** distinctions, so Caps Lock can be Escape when tapped and Control when held.
- **Per-device profiles**, which is what makes an external PC keyboard and the built-in one behave consistently.

**Karabiner-EventViewer** ships alongside it and shows the raw key codes a device is actually sending — the first stop when a key does not do what a rule expects.

## Notes

It installs a driver extension and needs **Input Monitoring** permission; on Apple Silicon expect one approval and a reboot at install. Rules live in `~/.config/karabiner/karabiner.json`, which is worth keeping in a dotfiles repository.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Hammerspoon](https://www.hammerspoon.org/) | Open source | Lua scripting for the whole system, keyboard included |
| [BetterTouchTool](https://folivora.ai/) | Paid | Broader: trackpad gestures, window snapping, remapping |
| [Keyboard Maestro](https://www.keyboardmaestro.com/) | Paid | Macro-first rather than key-first, and very powerful |
| [Kanata](https://github.com/jtroo/kanata) | Open source | The same layer model as a cross-platform CLI daemon |
| [QMK or ZMK firmware](https://qmk.fm/) | Open source | Remapping in the keyboard itself, so it follows the hardware |
| System Settings → Keyboard → Modifier Keys | Built in | Enough for Caps Lock to Escape alone |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask karabiner-elements
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://karabiner-elements.pqrs.org/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://karabiner-elements.pqrs.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/karabiner-elements" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://karabiner-elements.pqrs.org/docs/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< card link="https://github.com/pqrs-org/Karabiner-Elements" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
