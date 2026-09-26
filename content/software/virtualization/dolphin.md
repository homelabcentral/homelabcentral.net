---
title: "Dolphin"
weight: 6
description: "GameCube and Wii emulator, mature and native on Apple Silicon."
---

{{< lead >}}Two Nintendo consoles, emulated well enough that the emulator is the better way to play them.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/dolphin" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://dolphin-emu.org/download/" >}}

## What it does

Dolphin has been in development since 2003 and emulates the GameCube and Wii at high compatibility: internal resolution up to 8K, widescreen hacks, texture packs, save states, controller mapping for anything including real Wii Remotes over Bluetooth, and netplay that synchronises inputs rather than streaming video.

On Apple Silicon it is native, with a Metal backend through MoltenVK, and runs most of the library at full speed.

## Notes

- The Ubershaders option trades some GPU headroom for the elimination of shader compilation stutter. Turn it on; it is the single biggest quality-of-life setting.
- Wii games need a NAND dump from a console you own for some features; GameCube discs mostly do not.
- Emulation is lawful. Game images are not something the project supplies, and ripping your own discs is the intended route.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [OpenEmu](/software/virtualization/openemu/) or [RetroArch](/software/virtualization/retroarch/) | Open source | Run Dolphin as a core, a version or two behind |
| [Ryujinx](/software/virtualization/ryujinx/) | Open source | The Switch instead, and on much less certain legal footing |
| A Wii or Wii U | Paid | Original hardware, original resolution |
| [Nintendo Switch Online](https://www.nintendo.com/switch/online-service/) | Subscription | A handful of these games, licensed |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask dolphin
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://dolphin-emu.org/download/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://dolphin-emu.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/dolphin" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/dolphin-emu/dolphin" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://wiki.dolphin-emu.org/" title="Compatibility wiki" icon="book-open" subtitle="Per-game settings and status" >}}
{{< /cards >}}
