---
title: "Blackmagic RAW"
weight: 3
description: "BRAW codec, player and plugins."
---

{{< lead >}}The system-level support that lets other applications read `.braw` footage.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://www.blackmagicdesign.com/support/family/capture-and-playback" >}}

## What it does

Blackmagic RAW is a camera codec that keeps sensor data with the demosaic deferred to playback, while staying far smaller than traditional RAW. The installer provides:

- the codec itself, so applications on the machine can decode `.braw`,
- **Blackmagic RAW Player** for quick review of clips,
- **Blackmagic RAW Speed Test** for benchmarking decode performance,
- plugins for Adobe and Avid applications.

Resolve has BRAW support built in; this package is what makes the footage readable everywhere else.

## Notes

Not in Homebrew. Keep the codec version at or ahead of the camera firmware that produced the files — older decoders reject newer BRAW variants outright.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| Nothing | — | BRAW is Blackmagic's own format, and only their decoder reads it |
| [ProRes RAW](https://support.apple.com/en-us/102107), [Canon Cinema RAW Light](https://www.canon-europe.com/pro/stories/cinema-raw-light/) or [RED R3D](https://www.red.com/) | Built in / Free | The equivalent vendor packages for other cameras |
{{< /borderless-table >}}

## Install

[Blackmagic support downloads](https://www.blackmagicdesign.com/support/family/capture-and-playback)

## Links

{{< cards cols="2" >}}
{{< card link="https://www.blackmagicdesign.com/products/blackmagicraw" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://www.blackmagicdesign.com/developer/product/camera" title="Documentation" icon="book-open" subtitle="Developer SDK" >}}
{{< /cards >}}
