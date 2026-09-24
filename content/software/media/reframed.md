---
title: "Reframed"
weight: 5
description: "Screen recorder with a built-in editor."
---

{{< lead >}}Records the screen and opens straight into an editor for trimming, zooming and exporting.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://github.com/jkuri/homebrew-reframed" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/jkuri/Reframed/releases" >}}

## What it does

Reframed is a macOS screen recorder that treats the recording as the start rather than the end: capture a region, window or display, then trim, add zoom and pan moves, adjust the background and export — without moving the file into a separate editor.

That is the shape of tool that makes short product or documentation clips cheap to produce, where opening Resolve for a 20-second recording is absurd.

## Notes

- Available from the developer's own tap (`jkuri/reframed`), not homebrew-cask.
- Requires macOS 15 or newer, and **Screen Recording** permission.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Screen Studio](https://screen.studio/) | Paid | The app that defined this category of auto-zooming recorder |
| [CleanShot X](https://cleanshot.com/) | Paid | Best-in-class screenshots with competent recording |
| [Cap](https://cap.so/) | Freemium | A similar editor and a cloud tier |
| [ScreenFlow](https://www.telestream.net/screenflow/) | Paid | Heavier, a full editor rather than a recorder with trimming |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew tap jkuri/reframed
brew install --cask jkuri/reframed/reframed
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/jkuri/Reframed/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/jkuri/Reframed" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/jkuri/Reframed" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
