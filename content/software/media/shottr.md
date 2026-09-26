---
title: "Shottr"
weight: 8
description: "Fast native screenshot tool with annotation and OCR."
---

{{< lead >}}A 5MB Swift app that does most of what the paid screenshot tools do.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/shottr" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://shottr.cc/" >}}

## What it does

Shottr is a screenshot tool written natively for macOS and it shows: it opens instantly and uses almost no memory. Area, window and scrolling capture, then annotation — arrows, boxes, blur and pixelate, step counters and text — in the same window the capture appeared in.

Two features go beyond the category. It measures: pick two points and it reports the distance in pixels, and it reads colours under the cursor, which makes it a design-review tool as much as a screenshot one. And it runs OCR locally, so text in a screenshot becomes text on the clipboard without anything leaving the machine.

## Notes

- Free for personal use; a paid tier adds a few extras and supports development. No account, no cloud, no upload path at all.
- Apple Silicon only in current versions.
- Pinning a capture as a floating window on top of everything is the feature most people keep it for.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [CleanShot X](/software/media/cleanshot-x/) | Paid | More polish, recording, and a cloud if you want one |
| `⌘⇧4` and `⌘⇧5` | Built in | Always there, and every capture becomes a file on the Desktop |
| [Flameshot](https://flameshot.org/) | Open source | Cross-platform, and clumsier on a Mac |
| [Xnapper](https://xnapper.com/) | Paid | Aimed at pretty screenshots for marketing, not at measuring |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask shottr
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://shottr.cc/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://shottr.cc/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/shottr" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://shottr.cc/kb/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
