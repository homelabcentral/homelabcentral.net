---
title: "Yuzu"
weight: 12
description: "The Switch emulator Nintendo sued out of existence in 2024."
---

{{< lead >}}Discontinued, unavailable, and the reason every other page in this group reads the way it does.{{< /lead >}}

## What it was

Yuzu emulated the Nintendo Switch in C++, written by the developers behind the 3DS emulator Citra and for several years the most compatible Switch emulator available. It ran on Windows, Linux and Android.

## Status

{{< callout type="error" >}}
**Yuzu is gone and is not coming back.** Nintendo sued its developers in February 2024. The case settled within weeks: the project shut down, paid $2.4 million, and took Citra down with it. The source, the site and the builds were all withdrawn.

Sites still offering "Yuzu downloads" are not the project. Treat every one of them as hostile — this is exactly the kind of abandoned name that gets picked up and repackaged with adware.
{{< /callout >}}

## Why it still matters

The settlement is why the Switch emulators that followed behave as they do: own Git hosting instead of GitHub, mirrors that move, and a conspicuous silence about where firmware comes from. Nintendo's complaint leaned on the keys — the argument was that decrypting a game necessarily circumvents a technological protection measure under the DMCA, whatever the emulator itself does.

The codebase survives in forks, [Citron](/software/virtualization/citron/) among them, which is a fair description of where Yuzu actually went.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Citron](/software/virtualization/citron/) | Open source | The continuation of this codebase, rewritten since |
| [Ryujinx](/software/virtualization/ryujinx/) | Open source | A separate lineage, and the one that runs on macOS |
| [Astris](/software/virtualization/astris/) | Open source | Apple Silicon only, built on Ryujinx |
| A Nintendo Switch | Paid | The alternative nobody lists and everybody should consider |
{{< /borderless-table >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://en.wikipedia.org/wiki/Yuzu_(emulator)" title="Background" icon="information-circle" subtitle="The project and the lawsuit, on Wikipedia" >}}
{{< card link="/software/virtualization/citron/" title="Citron" icon="puzzle" subtitle="Where the codebase continued" >}}
{{< /cards >}}
