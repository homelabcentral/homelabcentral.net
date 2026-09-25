---
title: "PPSSPP"
weight: 10
description: "PSP emulator, fast and near-complete."
---

{{< lead >}}The rare emulator that is essentially finished.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/ppsspp-emulator" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.ppsspp.org/download/" >}}

## What it does

PPSSPP runs PSP titles at up to 10× the handheld's native resolution, with texture scaling and replacement packs, save states, controller mapping, and post-processing shaders. Compatibility is very high and performance is not a concern on any Apple Silicon Mac — it was written to run acceptably on phones a decade ago.

It reads ISO, CSO and extracted PSP folders directly, and needs no BIOS at all.

## Notes

- No BIOS requirement is the practical difference from every other console emulator here: supply a game and it runs.
- The Vulkan backend via MoltenVK is the fast path on macOS; the OpenGL one is the fallback for older games with shader issues.
- Emulation is lawful. The games are yours to rip from UMDs you own.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Vita3K](https://vita3k.org/) | Open source | The PS Vita, considerably less complete |
| [RetroArch](/software/virtualization/retroarch/) | Open source | PPSSPP as a core, with shaders and run-ahead around it |
| [OpenEmu](/software/virtualization/openemu/) | Open source | PSP via the experimental core set, inside a library |
| A PSP | Paid | The original screen, and a UMD drive |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask ppsspp-emulator
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.ppsspp.org/download/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.ppsspp.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/ppsspp-emulator" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/hrydgard/ppsspp" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://www.ppsspp.org/docs/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
