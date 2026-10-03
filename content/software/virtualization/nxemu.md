---
title: "NXEmu"
weight: 11
description: "Nintendo Switch emulator written in C++, Windows only."
---

{{< lead >}}A Switch emulator built largely from scratch rather than inherited from Yuzu — and, for now, Windows only.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/N3xoX1/nxemu" >}}

## What it does

NXEmu is an open-source Switch emulator in C++. Its distinguishing claim is its lineage: where most of the projects still standing descend from Yuzu, NXEmu is largely independent work that borrows only selectively, which matters in a field where a codebase's parentage has been the thing that ends it.

It is earlier in development than [Ryujinx](/software/virtualization/ryujinx/) or [Citron](/software/virtualization/citron/), and compatibility reflects that.

## Requirements

{{< callout type="warning" >}}
**Windows only.** There is no macOS build, and the project builds through a Visual Studio solution rather than a portable toolchain, so this is not a matter of compiling it yourself. On a Mac it runs only inside a Windows VM — see [Parallels Desktop](/software/virtualization/parallels/) or [UTM](/software/virtualization/utm/) — which stacks a virtual machine under an emulator and costs accordingly.

For emulating the Switch on a Mac directly, use [Ryujinx](/software/virtualization/ryujinx/) or [Astris](/software/virtualization/astris/).
{{< /callout >}}

## Legal position

Emulation itself is lawful in most jurisdictions. Obtaining the console's firmware, `prod.keys` or game images from anywhere other than hardware and cartridges you own is not. NXEmu ships none of them.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Ryujinx](/software/virtualization/ryujinx/) | Open source | Runs on macOS, and far more compatible today |
| [Astris](/software/virtualization/astris/) | Open source | Apple Silicon only, but native and actively built for it |
| [Citron](/software/virtualization/citron/) | Open source | Cross-platform including macOS, from the Yuzu lineage NXEmu avoids |
| A Nintendo Switch | Paid | The alternative nobody lists and everybody should consider |
{{< /borderless-table >}}

## Install

No Homebrew cask, and no Mac build to package. Builds and source are on the project's repository.

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/N3xoX1/nxemu" title="Repository" icon="github" subtitle="Source, builds and issues" >}}
{{< card link="https://en.wikipedia.org/wiki/Nintendo_Switch_emulation" title="Background" icon="information-circle" subtitle="The wider picture, on Wikipedia" >}}
{{< /cards >}}
