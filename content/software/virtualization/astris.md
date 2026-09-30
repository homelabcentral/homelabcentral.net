---
title: "Astris"
weight: 10
description: "Nintendo Switch emulator built specifically for Apple Silicon Macs."
---

{{< lead >}}A Ryujinx derivative that targets one platform instead of three, and is the better for it.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/V380-Ori/Astris.Binaries/releases" >}}

## What it does

Astris emulates the Nintendo Switch on Apple Silicon. It is based on Ryujinx, which is the part worth knowing: the emulation core is the mature C# one rather than something written from scratch, and the work has gone into the Mac rather than into portability.

That focus shows in the surface. Astris is organised around a library rather than a file picker — user profiles, controller and keyboard mapping, DLC and update selection, and gyroscope calibration for games that expect motion controls. It reads NSP and XCI, and NSZ as well, so Zstandard-compressed dumps do not have to be expanded first.

Rendering goes through Vulkan and Metal.

## Requirements

{{< callout type="warning" >}}
**Apple Silicon and macOS 15 or later only.** There is no Intel build and no build for anything else. An Intel Mac needs [Ryujinx](/software/virtualization/ryujinx/) instead, which is the general-purpose ancestor this project narrowed down from.
{{< /callout >}}

## Legal position

Emulation itself is lawful in most jurisdictions. Obtaining the console's firmware, `prod.keys` or game images from anywhere other than hardware and cartridges you own is not. Astris ships none of them.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Ryujinx](/software/virtualization/ryujinx/) | Open source | The codebase this came from, cross-platform and less Mac-specific |
| [Citron](/software/virtualization/citron/) | Open source | The Yuzu lineage instead, with macOS as a recent addition |
| A Nintendo Switch | Paid | The alternative nobody lists and everybody should consider |
{{< /borderless-table >}}

## Install

No Homebrew cask. Releases are published as signed `.dmg` files on the binaries repository; the source is MIT licensed.

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/V380-Ori/Astris.Binaries/releases" title="Releases" icon="download" subtitle="Current and previous builds" >}}
{{< card link="https://github.com/V380-Ori/Astris.Binaries" title="Repository" icon="github" subtitle="Distribution repository and notes" >}}
{{< /cards >}}
