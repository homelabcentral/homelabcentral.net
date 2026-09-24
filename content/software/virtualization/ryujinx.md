---
title: "Ryujinx"
weight: 3
description: "Nintendo Switch emulator written in C#."
---

{{< lead >}}A Switch emulator whose original project was shut down in 2024 and now continues as community forks.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://git.ryujinx.app/projects/Ryubing" >}}

## What it does

Ryujinx emulates the Nintendo Switch: it implements the console's ARM CPU, Maxwell GPU and operating system services well enough to run retail software, with Vulkan and Metal backends, upscaling beyond the console's native resolution, and controller mapping.

## Status

{{< callout type="warning" >}}
The original project ended on 1 October 2024, when its developer removed the source and organisation following an agreement with Nintendo. Builds from before that date still exist but receive no updates. Development continues in community forks — **Ryubing** and **Kenji-NX** — which have themselves moved off GitHub after takedown requests, so download locations change.
{{< /callout >}}

## Legal position

Emulation itself is lawful in most jurisdictions. What is not is obtaining the console's firmware, `prod.keys` or game images from anywhere other than hardware and cartridges you own. The emulator ships with none of them and cannot run anything without them.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Ryubing](https://git.ryujinx.app/projects/Ryubing) and [Kenji-NX](https://kenji-nx.org/) | Open source | The maintained forks of this codebase |
| [Eden](https://eden-emu.dev/) | Open source | A separate continuation of the emulation effort |
| [Dolphin](https://dolphin-emu.org/) | Open source | GameCube and Wii, mature, and legally unambiguous |
| A Nintendo Switch | Paid | The alternative that nobody lists and everybody should consider |
{{< /borderless-table >}}

## Install

Development continues as **Ryubing**, hosted on the project's own Git server rather than GitHub: [git.ryujinx.app/projects/Ryubing](https://git.ryujinx.app/projects/Ryubing)

The original `ryujinx.org` downloads and GitHub repository are gone.

## Links

{{< cards cols="2" >}}
{{< card link="https://git.ryujinx.app/projects/Ryubing" title="Ryubing fork" icon="code" subtitle="Active continuation of the codebase" >}}
{{< card link="https://en.wikipedia.org/wiki/Ryujinx" title="Background" icon="information-circle" subtitle="What happened, on Wikipedia" >}}
{{< /cards >}}
