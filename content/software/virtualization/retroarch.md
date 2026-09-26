---
title: "RetroArch"
weight: 5
description: "Libretro front end — every core, every platform, one interface."
---

{{< lead >}}The emulator front end that runs on everything and emulates nearly everything.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/retroarch-metal" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.retroarch.com/?page=platforms" >}}

## What it does

RetroArch is the reference front end for **libretro**, an API that emulators implement as loadable cores. Install the shell once, download cores from inside it, and every system — arcade, 8-bit, 16-bit, PlayStation, DS, DOS — runs through the same input mapping, save state system, shader pipeline and netplay stack.

The features that come from doing it at this layer are the reason to tolerate the interface: run-ahead, which removes frames of input lag the original hardware had; CRT shaders that reproduce scanlines and phosphor bloom properly; rewind; and achievements through RetroAchievements.

## Notes

- Two casks on macOS: `retroarch-metal` for the Metal renderer, and `retroarch` for the OpenGL build. Metal is the one to install unless a specific shader needs GL.
- The menu is its own universe, designed for a controller rather than a mouse. [OpenEmu](/software/virtualization/openemu/) exists because of exactly that.
- Cores that need a console BIOS will say so and refuse to run without it. Dumping one from hardware you own is your side of the deal.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [OpenEmu](/software/virtualization/openemu/) | Open source | Native, tidy, Mac-only, fewer systems |
| [Dolphin](/software/virtualization/dolphin/), [PCSX2](/software/virtualization/pcsx2/) and friends | Open source | Standalone builds, ahead of the equivalent cores |
| [EmulationStation](https://emulationstation.org/) | Open source | A launcher in front of emulators, rather than a host for them |
| [Batocera](https://batocera.org/) | Open source | The same stack as a whole operating system for a dedicated box |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask retroarch-metal    # Metal renderer
brew install --cask retroarch          # OpenGL build
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.retroarch.com/?page=platforms)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.retroarch.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/retroarch-metal" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/libretro/RetroArch" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://docs.libretro.com/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
