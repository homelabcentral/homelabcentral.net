---
title: "Clop"
weight: 22
description: "Optimise images, video, PDFs and the clipboard automatically."
---

{{< lead >}}Shrinks whatever you just copied or recorded, in place, before you get round to sending it.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/clop" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://lowtechguys.com/clop" >}}

## What it does

Clop watches for new images, videos and PDFs and optimises them without being asked. Copy a screenshot and the clipboard version is already smaller when you paste it; stop a screen recording and the file is re-encoded by the time you reach for it. The quality loss is minimal and the size difference is the kind that turns a rejected attachment into an accepted one.

A floating control appears per file, with hotkeys for downscaling (incremental, or straight to a fraction of the original), cropping to an aspect ratio, converting a video to GIF, changing speed, muting or stripping audio, and re-encoding to a compatible MP4. Video encoding can run on Apple Silicon's Media Engine rather than the CPU, which is the difference between a warm laptop and a quiet one.

There is also a drop zone: drag files onto it to optimise in place, hold **Command** for more aggressive settings, and define preset zones that run a Shortcut on whatever is dropped — convert to WebP, downscale to 50%, watermark.

## Notes

- Free to use, with a one-off **Clop Pro** licence for the full feature set. The source is GPL-3.0.
- It is the automatic layer over the same job [ImageOptim](/software/design/imageoptim/) does by hand, and it reaches video, which ImageOptim does not.
- macOS 13 or later.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [ImageOptim](/software/design/imageoptim/) | Open source | Lossless image work, by hand, no video |
| [HandBrake](/software/media/handbrake/) | Open source | Far more control over the encode, nothing automatic |
| [gifski](/software/media/gifski/) | Open source | Better GIFs, and only GIFs |
| [ffmpeg](/software/media/ffmpeg/) | Open source | Everything, once you have written the command |
| Sending the original file | — | No install, and a rejected attachment |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask clop
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://lowtechguys.com/clop)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://lowtechguys.com/clop" title="Homepage" icon="globe-alt" subtitle="Official site and licence" >}}
{{< card link="https://formulae.brew.sh/cask/clop" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/FuzzyIdeas/Clop" title="FuzzyIdeas/Clop" icon="github" subtitle="Source, GPL-3.0" >}}
{{< /cards >}}
