---
title: "ImageOptim"
weight: 2
description: "Drag-and-drop lossless image compression."
---

{{< lead >}}Strips metadata and recompresses PNG and JPEG files in place, without visible quality loss.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/imageoptim" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://imageoptim.com/mac" >}}

## What it does

ImageOptim runs a pipeline of optimisers — Zopfli, PNGOUT, OxiPNG, AdvPNG, MozJPEG, Guetzli — and keeps whichever produces the smallest file. It also strips EXIF, colour profiles and thumbnails, which on a photo straight from a phone is frequently the majority of the payload.

Files are replaced in place, so the workflow is dragging a folder onto the window.

## Notes

- Lossy mode exists and is off by default; leave it off when the source is the only copy.
- Stripping EXIF removes GPS coordinates — worth doing on anything about to be published from a home address.
- For build-time optimisation Hugo's own image pipeline (`resources.Get` plus `.Resize`/`.Process`) covers most of this without a manual step.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Squoosh](https://squoosh.app/) | Free | Google's web-based compressor, with a live quality comparison |
| [TinyPNG](https://tinypng.com/) | Freemium | The well-known web and API service |
| [oxipng](https://github.com/oxipng/oxipng), [pngquant](https://pngquant.org/) and [jpegoptim](https://github.com/tjko/jpegoptim) | Open source | The same engines from the command line |
| [Hugo](/software/toolchains/hugo/), [Sharp](https://sharp.pixelplumbing.com/) or [vips](https://www.libvips.org/) in a build step | Open source | Better than optimising by hand at all |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask imageoptim
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://imageoptim.com/mac)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://imageoptim.com/mac" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/imageoptim" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/ImageOptim/ImageOptim" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
