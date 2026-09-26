---
title: "OpenEmu"
weight: 4
description: "One Mac-native front end over dozens of emulator cores."
---

{{< lead >}}Every retro console behind a single library window that looks like it came from Apple.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/openemu" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://openemu.org/" >}}

## What it does

OpenEmu wraps established emulator cores — Nestopia, Snes9x, Genesis Plus GX, Mupen64Plus, Mednafen and around thirty others — in one native Cocoa application. Drop a ROM in and it identifies the system, fetches box art and metadata, and files it in a library that behaves like Music did.

Save states, rewind, shaders, controller mapping per system and screenshots are handled once, at the front end, rather than differently in every emulator.

## Notes

- Nintendo DS, Saturn, PSP and newer systems live in the separate **Experimental** core set, enabled in preferences.
- Because the cores are third-party, accuracy and compatibility are whatever that core does — OpenEmu's contribution is the shell around them.
- Emulation is lawful; obtaining the games and any required BIOS files is only lawful from hardware and media you own. Nothing ships with either.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [RetroArch](/software/virtualization/retroarch/) | Open source | The same idea with vastly more cores and a worse interface |
| A standalone emulator per system | Open source | Better accuracy and per-system options, no library |
| [Dolphin](/software/virtualization/dolphin/) | Open source | GameCube and Wii specifically, far ahead of any core |
| [Nintendo Switch Online](https://www.nintendo.com/switch/online-service/) | Subscription | The licensed way to play a much shorter list |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask openemu
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://openemu.org/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://openemu.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/openemu" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/OpenEmu/OpenEmu" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/OpenEmu/OpenEmu/wiki/User-guide" title="Documentation" icon="book-open" subtitle="User guide" >}}
{{< /cards >}}
