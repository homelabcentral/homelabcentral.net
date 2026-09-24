---
title: "GIF Maker, GIF Editor"
weight: 14
description: "Make and edit GIFs on macOS."
---

{{< lead >}}A small App Store utility for turning clips and images into GIFs.{{< /lead >}}

{{< badge content="Mac App Store" color="purple" icon="shopping-bag" size="lg" link="https://apps.apple.com/us/app/id6751730393" >}}

## What it does

Converts video clips and image sequences into animated GIFs, with trimming, frame rate and size controls, plus basic editing of existing GIFs — reorder, crop, add text or speed changes.

It is an iPhone and iPad app running on Apple Silicon rather than a native Mac app, which is why the interface is touch-shaped.

## Notes

For anything scriptable or quality-sensitive, `ffmpeg` with a generated palette produces noticeably better GIFs:

```shell
ffmpeg -i in.mp4 -vf "fps=15,scale=800:-1:flags=lanczos,palettegen" palette.png
ffmpeg -i in.mp4 -i palette.png -lavfi "fps=15,scale=800:-1:flags=lanczos[x];[x][1:v]paletteuse" out.gif
```

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Gifski](https://gif.ski/) | Open source | Produces noticeably better GIFs |
| ffmpeg with `palettegen` | Open source | The best quality available, and scriptable |
| [ezgif.com](https://ezgif.com/) | Free | No install, fine for one-off edits |
| [CleanShot X](https://cleanshot.com/) | Paid | Records straight to GIF |
{{< /borderless-table >}}

## Install

[GIF Editor & GIF Maker on the App Store](https://apps.apple.com/us/app/id6751730393)

Or with `mas`:

```shell
mas install 6751730393
```

## Links

{{< cards cols="2" >}}
{{< card link="https://apps.apple.com/us/app/id6751730393" title="Mac App Store" icon="shopping-bag" subtitle="Free, iOS app on Apple Silicon" >}}
{{< /cards >}}
