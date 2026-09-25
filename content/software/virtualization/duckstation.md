---
title: "DuckStation"
weight: 11
description: "PlayStation 1 emulator with accurate timing and modern rendering."
---

{{< lead >}}The PS1, with the wobbling polygons fixed and the timing left alone.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.duckstation.org/" >}}

## What it does

DuckStation emulates the original PlayStation with unusual care about the parts that produce its look: the console had no sub-pixel precision, so geometry visibly jitters, and no perspective-correct texture mapping, so textures warp. DuckStation can emulate both faithfully or correct both, per game.

Around that: upscaling to any internal resolution, PGXP for stable geometry, texture replacement, rewind, save states, achievements and per-game settings from a compatibility database.

## Notes

- Needs a PS1 BIOS image from a console you own. None ships with it.
- No Homebrew cask. The macOS build is a universal `.zip` on the project's releases page, and it self-updates afterwards.
- Emulation is lawful; the BIOS and the discs are yours to dump.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [PCSX2](/software/virtualization/pcsx2/) | Open source | The PlayStation 2 instead |
| [RetroArch](/software/virtualization/retroarch/) | Open source | Runs Beetle PSX or SwanStation, with shaders and run-ahead |
| [OpenEmu](/software/virtualization/openemu/) | Open source | Mednafen's PS1 core inside a native library |
| A PlayStation Classic or a real PS1 | Paid | Original hardware, original 240p |
{{< /borderless-table >}}

## Install

Download the macOS build from the project's releases — there is no cask:

[duckstation.org](https://www.duckstation.org/) · [releases on GitHub](https://github.com/stenzek/duckstation/releases/latest)

```shell
# unquarantine after extracting, as with any unsigned download
xattr -dr com.apple.quarantine /Applications/DuckStation.app
```

## Links

{{< cards cols="2" >}}
{{< card link="https://www.duckstation.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/stenzek/duckstation" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/stenzek/duckstation/releases/latest" title="Releases" icon="download" subtitle="macOS universal build" >}}
{{< /cards >}}
