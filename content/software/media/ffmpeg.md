---
title: "FFmpeg"
weight: 13
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

## Aliases

FFmpeg's power is also its problem: the invocation is longer than the job. These wrap the handful of things worth doing repeatedly. Drop the block in `~/.zshrc` — or in a file it sources.

```shell
# Defined only when ffmpeg is on PATH, so shells without it start clean.
if (( $+commands[ffmpeg] )); then
  # What is this file, really.
  ffinfo() { ffprobe -hide_banner "$@" }
  ffdur()  { ffprobe -v error -show_entries format=duration -of csv=p=0 "$1" }

  # Software H.264 — slower, smaller, and plays on everything. ff264 in [out] [crf]
  ff264() {
    ffmpeg -i "$1" -c:v libx264 -preset slow -crf "${3:-20}" -pix_fmt yuv420p \
      -c:a aac -b:a 192k -movflags +faststart "${2:-${1:r}.mp4}"
  }

  # Hardware HEVC on Apple Silicon — many times faster, slightly larger at equal
  # quality. -tag:v hvc1 is what makes QuickTime and Safari accept the result.
  ffhevc() {
    ffmpeg -i "$1" -c:v hevc_videotoolbox -q:v "${3:-60}" -tag:v hvc1 \
      -c:a aac -b:a 192k -movflags +faststart "${2:-${1:r}-hevc.mp4}"
  }

  # 1080p cap. -2 keeps the aspect ratio and an even height; min() never upscales.
  ff1080() {
    ffmpeg -i "$1" -vf "scale='min(1920,iw)':-2" -c:v libx264 -preset slow -crf 21 \
      -pix_fmt yuv420p -c:a aac -b:a 160k -movflags +faststart "${2:-${1:r}-1080p.mp4}"
  }

  # Audio out. ffaudio keeps the source stream, ffmp3 re-encodes.
  ffaudio() { ffmpeg -i "$1" -vn -c:a copy "${2:-${1:r}.m4a}" }
  ffmp3()   { ffmpeg -i "$1" -vn -c:a libmp3lame -q:a 0 "${2:-${1:r}.mp3}" }

  # Trim without re-encoding. ffcut in.mp4 00:01:20 00:02:45 [out]
  ffcut() {
    (( $# < 3 )) && { print -u2 'usage: ffcut IN START END [OUT]'; return 2 }
    ffmpeg -ss "$2" -to "$3" -i "$1" -c copy "${4:-${1:r}-cut.${1:e}}"
  }

  # Two-pass GIF. Generating a palette first is the whole difference in quality.
  # ffgif in.mp4 [out.gif] [fps] [width]
  ffgif() {
    local dir=$(mktemp -d -t ffgif)
    ffmpeg -v warning -i "$1" \
      -vf "fps=${3:-15},scale=${4:-800}:-1:flags=lanczos,palettegen" -y "$dir/p.png" &&
    ffmpeg -v warning -i "$1" -i "$dir/p.png" \
      -lavfi "fps=${3:-15},scale=${4:-800}:-1:flags=lanczos[x];[x][1:v]paletteuse" \
      -y "${2:-${1:r}.gif}"
    rm -rf "$dir"
  }

  # Stills. ffframes in.mp4 [fps]
  ffframes() { ffmpeg -i "$1" -vf "fps=${2:-1}" "${1:r}-%04d.png" }

  # Join files that already share a codec, no re-encode. ffcat a.mp4 b.mp4 out.mp4
  ffcat() {
    local list=$(mktemp -t ffcat)
    local f; for f in "${@[1,-2]}"; do printf "file '%s'\n" "${f:A}" >> "$list"; done
    ffmpeg -f concat -safe 0 -i "$list" -c copy "${@[-1]}"
    rm -f "$list"
  }
fi
```

{{< borderless-table >}}
| Alias | Does |
| --- | --- |
| `ffinfo in.mkv` | Streams, codecs and container, from `ffprobe` |
| `ffdur in.mkv` | Duration in seconds, for scripting |
| `ff264 in.mkv` | H.264 + AAC mp4, `faststart` so it streams before it finishes downloading |
| `ffhevc in.mov` | The same job on the hardware encoder, when speed matters more than size |
| `ff1080 in.mkv` | Capped at 1920 wide, never upscaled |
| `ffaudio` / `ffmp3` | Audio only — copied out, or re-encoded for players that only speak mp3 |
| `ffcut in.mp4 1:20 2:45` | That section, no re-encode |
| `ffgif in.mp4` | A GIF worth looking at, via a generated palette |
| `ffframes in.mp4 2` | Two stills a second as PNGs |
| `ffcat a.mp4 b.mp4 out.mp4` | Join, no re-encode |
{{< /borderless-table >}}

Two things to know before relying on them. `ffcut` and `ffcat` copy streams rather than re-encoding, so cuts land on the nearest keyframe and joining only works when every input shares a codec and resolution — add `-c:v libx264 -crf 20` to either when that is not true. And the syntax is zsh: `${1:r}` and `${1:e}` (path without extension, and extension) and `${@[1,-2]}` have no bash equivalent, so under bash use `${1%.*}`, `${1##*.}` and `"${@:1:$#-1}"`.

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
