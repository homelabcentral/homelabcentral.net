---
title: "OBS Studio"
weight: 4
description: "Live streaming and screen recording with scene compositing."
---

{{< lead >}}Scene-based capture and streaming — the standard tool for recording a screen with overlays.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/obs" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://obsproject.com/download" >}}

## What it does

OBS composites **sources** (display capture, window capture, camera, microphone, browser page, image, text) into **scenes**, and either records them to disk or streams them over RTMP/SRT to any endpoint. Scene switching, per-source filters, audio mixing with per-track routing, and a virtual camera for use in other apps are all built in.

For documentation work the useful part is window capture plus a zoom/crop filter: a clean recording of one app at a fixed size, no desktop clutter.

## Notes

- Needs **Screen Recording** and **Microphone** permissions; macOS will silently record a black rectangle otherwise.
- Hardware encoding uses VideoToolbox on Apple Silicon — much lighter than x264 for long recordings.
- Plugins install to `~/Library/Application Support/obs-studio/plugins/`.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [ScreenFlow](https://www.telestream.net/screenflow/) and [Camtasia](https://www.techsmith.com/camtasia/) | Paid | Recording plus a real editing timeline |
| [Ecamm Live](https://www.ecamm.com/mac/ecammlive/) | Freemium | Mac-native live production, much simpler than OBS |
| [Streamlabs Desktop](https://streamlabs.com/) | Free | An OBS fork with streaming services bundled in |
| ⇧⌘5 (Screenshot toolbar) | Built in | Built into macOS, enough for a plain screen recording |
| [Loom](https://www.loom.com/) | Freemium | Cloud, for recordings meant to be shared as links |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask obs
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://obsproject.com/download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://obsproject.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/obs" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/obsproject/obs-studio" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://obsproject.com/kb" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
