---
title: "Cap"
weight: 10
description: "Open-source screen recorder with auto-zoom and an optional cloud."
---

{{< lead >}}The open-source answer to Screen Studio, with a hosted tier if you want links.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/cap" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://cap.so/download" >}}

## What it does

Cap records screen and camera and then applies the same treatment the paid recorders do: automatic zoom toward clicks, smoothed cursor motion, a background and rounded corners around the window, and a camera bubble. All of it is adjustable after the fact in the built-in editor, and export is a local MP4 or GIF.

Two modes, and the distinction matters. **Studio mode** records locally at full quality and edits afterwards. **Instant mode** uploads while recording and hands back a link as soon as you stop, which is the fast path for "here is what I mean" and the one that involves a server.

## Notes

- Local recording and the editor are free and open source. The paid tier is the hosted sharing, and the server can be self-hosted instead.
- Instant mode streams to the cloud as it records — do not use it for anything you would not paste into a public chat.
- Built in Rust and Tauri rather than Electron, so it is noticeably lighter than [Kap](/software/media/kap/).

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Screen Studio](/software/media/screen-studio/) | Paid | More refined output, no free tier, no source |
| [Reframed](/software/media/reframed/) | Free | Native, single developer, no cloud at all |
| [Loom](https://www.loom.com/) | Freemium | The product Instant mode is chasing; browser-based and account-first |
| [OBS Studio](/software/media/obs/) | Open source | Records anything, compositing and streaming, zero post-processing |
| [Kap](/software/media/kap/) | Open source | Simpler, older, no zoom effects |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask cap
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://cap.so/download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://cap.so/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/cap" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/CapSoftware/Cap" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://cap.so/docs" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
