---
title: "IINA"
weight: 11
description: "Modern open-source media player for macOS."
---

{{< lead >}}An mpv-based player that behaves like a Mac app rather than a port.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/iina" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://iina.io/download/" >}}

## What it does

IINA wraps `mpv` in a native macOS interface: picture-in-picture, Touch Bar and trackpad gestures, dark mode, a proper playlist sidebar, subtitle search and per-file playback settings. Because the engine is mpv it plays essentially anything, with hardware decoding through VideoToolbox.

Advanced mpv options are exposed in settings, and `mpv.conf`-style configuration is honoured — so the tuning knobs are there without giving up a Mac-shaped UI.

## Notes

A better default than VLC for day-to-day local playback: better colour handling, smoother scrubbing, and it respects macOS conventions. VLC is the one to fall back to for awkward files and network streams.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [mpv](https://mpv.io/) | Open source | The engine IINA wraps, if you would rather configure it directly |
| [VLC](/software/media/vlc/) | Open source | Plays more obscure things, looks less like a Mac app |
| [Movist Pro](https://movistprime.com/) or [Elmedia](https://mac.eltima.com/media-player.html) | Paid | Native players with their own strengths |
| [QuickTime Player](https://support.apple.com/guide/quicktime-player/welcome/mac) | Built in | Fine for ProRes and H.264 |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask iina
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://iina.io/download/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://iina.io/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/iina" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/iina/iina" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
