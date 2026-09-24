---
title: "FFmpeg"
weight: 8
description: "Decode, encode, transcode, mux, stream and filter anything."
---

{{< lead >}}The library and CLI that nearly every other media tool calls underneath.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/ffmpeg-full" >}} {{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/ffmpeg" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://ffmpeg.org/download.html" >}}

## What it does

FFmpeg reads and writes essentially every container and codec in use, and exposes a filter graph for scaling, cropping, overlaying, mixing, subtitling and frame-rate conversion. Almost every GUI media tool in this category — HandBrake, LosslessCut, yt-dlp, the DownloadHelper companion — is a front end over it.

```shell
# transcode to a widely compatible H.264 file
ffmpeg -i in.mkv -c:v libx264 -crf 20 -c:a aac out.mp4

# hardware encode on Apple Silicon
ffmpeg -i in.mov -c:v hevc_videotoolbox -q:v 60 out.mp4

# extract audio without re-encoding
ffmpeg -i in.mp4 -vn -c:a copy out.m4a

# frames as images, one per second
ffmpeg -i in.mp4 -vf fps=1 frame_%04d.png
```

## Which formula

`ffmpeg-full` is a Homebrew build with a wider set of optional libraries enabled than the standard `ffmpeg` formula — extra codecs, filters like `frei0r` and `rubberband`, and additional protocols. Bigger install, fewer "unknown encoder" dead ends.

## Notes

`ffprobe` ships with it and is the faster way to answer "what actually is this file": `ffprobe -hide_banner in.mkv`.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [GStreamer](https://gstreamer.freedesktop.org/) | Open source | Pipeline-based, aimed at applications rather than one-off commands |
| [Shutter Encoder](https://www.shutterencoder.com/) or [HandBrake](/software/media/handbrake/) | Free / Open source | Graphical front ends when the invocation is the hard part |
| AVFoundation and `avconvert` | Built in | Apple's own, limited but already present |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install ffmpeg-full    # wider codec and filter set
brew install ffmpeg         # standard build
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Static builds and source](https://ffmpeg.org/download.html)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://ffmpeg.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/ffmpeg" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://ffmpeg.org/ffmpeg.html" title="Documentation" icon="book-open" subtitle="The (very long) manual" >}}
{{< card link="https://ffmpeg.org/ffmpeg-filters.html" title="Filter reference" icon="adjustments" subtitle="Every filter and its options" >}}
{{< /cards >}}
