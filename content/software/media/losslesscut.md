---
title: "LosslessCut"
weight: 7
description: "Trim and join video without re-encoding."
---

{{< lead >}}Cuts and concatenates media by copying streams — instant, and no generation loss.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/losslesscut" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/mifi/lossless-cut/releases" >}}

## What it does

LosslessCut operates on stream copies rather than re-encodes. Marking in and out points and exporting takes seconds regardless of file length, and the output is bit-identical to the source within the kept range. It also merges files, extracts individual streams, fixes container issues and edits metadata.

This is the right tool for the first pass on long footage — cutting a two-hour recording down to the usable ten minutes before anything touches an editor.

## The one real limitation

Cuts land on keyframes. Asking for a frame-exact cut between keyframes means either accepting the nearest keyframe or letting it re-encode that segment. For a rough cut that never matters; for a precise edit, do it in an NLE.

## Notes

It is a GUI over `ffmpeg`, so anything it does is reproducible on the command line — it just spares you constructing the invocation.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| `ffmpeg -c copy` | — | Exactly what LosslessCut runs, minus the timeline |
| [Avidemux](https://avidemux.sourceforge.net/) | Open source | Similar keyframe-based cutting, an older interface |
| [QuickTime Player](https://support.apple.com/guide/quicktime-player/welcome/mac) | Built in | ⌘T trims without re-encoding, one clip at a time |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask losslesscut
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/mifi/lossless-cut/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/mifi/lossless-cut" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/losslesscut" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/mifi/lossless-cut" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
