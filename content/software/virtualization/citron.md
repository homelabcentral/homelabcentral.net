---
title: "Citron"
weight: 9
description: "Nintendo Switch emulator continuing the Yuzu codebase."
---

{{< lead >}}The Yuzu fork that outlived its parent, rewritten far enough that calling it a fork undersells it.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://citron-emu.org/" >}}

## What it does

Citron emulates the Nintendo Switch — the ARM CPU, the Maxwell GPU and enough of Horizon, the console's operating system, to run retail software. It renders through Vulkan, upscales beyond the console's 1080p docked output, and implements LDN, the Switch's local wireless protocol, so two instances can see each other as if they were two consoles in the same room.

It began in July 2024 as a fork of Yuzu, a few months after Nintendo's lawsuit ended that project. The 0.7 release rewrote enough of the inherited code that the lineage is now more historical than structural.

## macOS support

macOS is supported, but it arrived late — a January 2026 release added it alongside Android on x86-64, and the Windows and Linux builds remain the ones that get tested first. Expect the Mac build to trail.

## Where to get it

The project hosts its own Git server and forge rather than relying on GitHub, having been through the same takedown pattern as every other project in this section.

{{< callout type="warning" >}}
Download locations for Switch emulators change without notice, and the abandoned names get squatted by sites bundling adware. `citron-emu.org` is the project's own; anything calling itself an official mirror is not one.
{{< /callout >}}

## Legal position

Emulation itself is lawful in most jurisdictions. Obtaining the console's firmware, `prod.keys` or game images from anywhere other than hardware and cartridges you own is not. Citron ships none of them and cannot start a game without them — which is the whole of what this page has to say on the subject.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Ryujinx](/software/virtualization/ryujinx/) | Open source | A separate codebase rather than a Yuzu descendant, and better established on macOS |
| [Astris](/software/virtualization/astris/) | Open source | Apple Silicon only, and built for Macs rather than ported to them |
| [Eden](https://eden-emu.dev/) | Open source | Another continuation of the same codebase, with its own release cadence |
| A Nintendo Switch | Paid | The alternative nobody lists and everybody should consider |
{{< /borderless-table >}}

## Install

No Homebrew cask exists. The macOS build is a direct download from the project.

{{< callout type="info" >}}
There is a `cemu` cask in Homebrew, and it is **not** a console emulator — see [Cemu](/software/virtualization/cemu/) for that collision.
{{< /callout >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://citron-emu.org/" title="Homepage" icon="globe-alt" subtitle="Downloads and release notes" >}}
{{< card link="https://emulation.gametechwiki.com/index.php/Nintendo_Switch_emulators" title="Background" icon="information-circle" subtitle="How the projects in this space relate" >}}
{{< /cards >}}
