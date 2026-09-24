---
title: "ImageMagick"
weight: 3
description: "Command-line image conversion and manipulation."
---

{{< lead >}}Scriptable image work: convert, resize, composite, annotate, in batch.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/imagemagick" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://imagemagick.org/script/download.php" >}}

## What it does

ImageMagick reads and writes 200-plus image formats and exposes nearly every raster operation from the command line. The modern entry point is `magick`.

```shell
magick in.png -resize 800x out.webp
magick in.jpg -strip -quality 82 out.jpg
magick *.png -delay 10 -loop 0 out.gif
magick in.heic out.jpg
magick identify -verbose in.png | head -20
```

## Where it earns its place

Batch work and build scripts. Anything that has to happen to 200 files, or the same way every time, belongs in a script rather than a GUI.

## Notes

`identify` answers "what is this file, really", and `magick -list format` shows which formats this build actually supports — HEIC and JPEG XL depend on optional delegate libraries being present.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [libvips](https://www.libvips.org/) | Open source | Much faster and far lighter on memory for large images |
| [GraphicsMagick](http://www.graphicsmagick.org/) | Open source | An older ImageMagick fork, leaner and more stable in API |
| sips | Built in | Built into macOS, enough for resizing and format conversion |
| [ffmpeg](/software/media/ffmpeg/) | Open source | Surprisingly capable on still images, and probably already present |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install imagemagick
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://imagemagick.org/script/download.php)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://imagemagick.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/imagemagick" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://imagemagick.org/script/command-line-processing.php" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< card link="https://github.com/ImageMagick/ImageMagick" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
