---
title: "Gifski"
weight: 20
description: "Highest-quality GIF encoder, CLI and app."
---

{{< lead >}}Turns video into GIFs that do not look like GIFs — thousands of colours instead of 256.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/gifski" >}} {{< badge content="Mac App Store" color="purple" icon="shopping-bag" size="lg" link="https://apps.apple.com/us/app/id1351639930" >}}

## What it does

The GIF format allows 256 colours per frame. Every naive encoder picks one palette for the whole animation, which is where the banding and the muddy gradients come from. Gifski runs pngquant per frame, so each frame gets its own palette, and dithers across frames so the result stays temporally stable rather than shimmering.

The cost is time and file size — it is slower than `ffmpeg` and the output is usually larger, because it is spending those bytes on colour.

```shell
# from a video, 20fps, 800px wide
gifski -o out.gif --fps 20 --width 800 in.mp4

# from a sequence of frames
gifski -o out.gif --fps 20 frame_*.png

# smaller, at some quality cost
gifski -o out.gif --fps 15 --width 640 --quality 80 in.mp4
```

## Notes

- The Homebrew formula depends on `ffmpeg`, which is what gives it video input. The App Store app is the same encoder with a drag-and-drop window.
- `--width` matters more than `--quality` for file size: halving the dimensions quarters the pixel count.
- For a screen recording that is mostly flat UI, `ffmpeg` with `palettegen` is usually good enough and much faster. Gifski earns its time on real video — gradients, skin tones, motion.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| ffmpeg with `palettegen` | Open source | One palette for the whole clip, far faster, smaller files |
| [GIF Maker, GIF Editor](/software/media/gif-maker/) | Free | A GUI with trimming and editing, ordinary output quality |
| [CleanShot X](/software/media/cleanshot-x/) | Paid | Records straight to GIF, no separate conversion step |
| [ezgif.com](https://ezgif.com/) | Free | No install, fine for one-off edits |
| An mp4 or WebM | — | Better quality at a fraction of the size, wherever a video tag is allowed |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install gifski
```

{{< /tab >}}
{{< tab name="Mac App Store" >}}

[Gifski on the Mac App Store](https://apps.apple.com/us/app/id1351639930)

Or with `mas`:

```shell
mas install 1351639930
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://gif.ski/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/gifski" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/ImageOptim/gifski" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://apps.apple.com/us/app/id1351639930" title="Mac App Store" icon="shopping-bag" subtitle="Free on the Mac App Store" >}}
{{< /cards >}}
