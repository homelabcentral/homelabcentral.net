---
title: "PCSX2"
weight: 9
description: "PlayStation 2 emulator, native on Apple Silicon."
---

{{< lead >}}The PS2 library at a resolution the PS2 never managed.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/pcsx2" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://pcsx2.net/downloads" >}}

## What it does

PCSX2 emulates the PlayStation 2 — a famously awkward machine, with its Emotion Engine, vector units and a graphics synthesiser nothing else resembles. Compatibility is now well above 95% of the retail library, with internal resolution scaling, texture filtering, widescreen and 60Hz patches, save states and per-game configuration.

The Qt interface handles game libraries, and the automatic settings database applies the known-good workarounds per title so most games need nothing configured.

## Notes

- Needs a PS2 BIOS image dumped from a console you own. The project does not distribute one, and will not run without it.
- Apple Silicon builds are native and recent; anything found from the 1.6 era is Intel-only and much slower under Rosetta.
- Emulation is lawful. The BIOS and the discs are yours to dump.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [DuckStation](/software/virtualization/duckstation/) | Open source | The PlayStation 1 instead, from the same corner of the scene |
| [RetroArch](/software/virtualization/retroarch/) | Open source | PCSX2 as a core, behind the standalone build |
| [RPCS3](https://rpcs3.net/) | Open source | The PlayStation 3, and still rough on macOS |
| A PlayStation 2 | Paid | Original hardware, 480i, and a disc drive that still works or does not |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask pcsx2
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://pcsx2.net/downloads)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://pcsx2.net/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/pcsx2" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/PCSX2/pcsx2" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://pcsx2.net/docs/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
