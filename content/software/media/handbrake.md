---
title: "HandBrake"
weight: 11
description: "Open-source video transcoder with presets."
---

{{< lead >}}Turns any video into an H.264/H.265/AV1 file using presets that already know what devices want.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/handbrake-app" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://handbrake.fr/downloads.php" >}}

## What it does

HandBrake is a GUI over the encoding libraries — x264, x265, SVT-AV1, VideoToolbox — with a preset system that covers the boring decisions: resolution, bitrate or quality target, audio passthrough or re-encode, subtitle burn-in, deinterlacing and cropping.

Typical use is shrinking recordings for archive or making a file play on a device that refuses the original codec. Batch processing via the queue means a folder of files can be handed over and left.

## Notes

- The cask token is `handbrake-app`; `handbrake` is the CLI (`HandBrakeCLI`).
- On Apple Silicon the VideoToolbox encoders are dramatically faster than x265 at similar file sizes for most content.
- HandBrake will not open encrypted commercial discs without `libdvdcss`, which it deliberately does not bundle.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Shutter Encoder](https://www.shutterencoder.com/) | Free | Wider format coverage, an uglier interface |
| [Permute](https://software.charliemonroe.net/permute/) | Paid | Drag-and-drop simple, no encoder settings to get wrong |
| [Compressor](https://www.apple.com/final-cut-pro/compressor/) | Paid | Apple's, integrates with Final Cut Pro |
| [ffmpeg](/software/media/ffmpeg/) | Open source | The same encoders, scriptable, no presets to hide behind |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask handbrake-app
```

{{< /tab >}}
{{< tab name="CLI" >}}

```shell
brew install handbrake
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://handbrake.fr/downloads.php)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://handbrake.fr/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/handbrake-app" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/HandBrake/HandBrake" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://handbrake.fr/docs/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
