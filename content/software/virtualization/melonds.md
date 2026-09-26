---
title: "melonDS"
weight: 8
description: "Nintendo DS and DSi emulator focused on accuracy."
---

{{< lead >}}The DS emulator that cares about being right rather than being fast.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/melonds" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://melonds.kuribo64.net/downloads.php" >}}

## What it does

melonDS emulates the DS and the DSi, including the parts other emulators skipped: the ARM7 co-processor timing, the 3D rasteriser's quirks, the microphone, the camera, and local wireless between two instances — which is how multiplayer that required two consoles actually works again.

It has a hardware-accelerated renderer for upscaling, save states, and DSi mode with a real NAND image.

## Notes

- Layouts matter more here than in other emulators: the two screens can be stacked, side by side, or rotated, and the touch screen maps to the mouse or a trackpad.
- DSi mode needs BIOS and firmware images dumped from a console you own. DS mode can run on built-in replacements.
- Emulation is lawful; the ROMs and BIOS files are yours to supply from hardware you own.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [DeSmuME](https://desmume.org/) | Open source | Older, broader game compatibility, less accurate timing |
| [OpenEmu](/software/virtualization/openemu/) | Open source | DS through an experimental core, inside a proper library |
| [RetroArch](/software/virtualization/retroarch/) | Open source | melonDS as a core, with run-ahead and shaders around it |
| A Nintendo DS | Paid | Two real screens and a stylus that works |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask melonds
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://melonds.kuribo64.net/downloads.php)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://melonds.kuribo64.net/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/melonds" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/melonDS-emu/melonDS" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
