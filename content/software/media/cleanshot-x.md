---
title: "CleanShot X"
weight: 6
description: "Screenshot and screen recording tool with annotation and a cloud."
---

{{< lead >}}The screenshot tool macOS should have shipped, and a competent recorder alongside it.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/cleanshot" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://cleanshot.com/" >}}

## What it does

CleanShot X replaces ⌘⇧4 entirely. Captures land in an overlay rather than on the Desktop, so they can be annotated, copied, pinned to the screen or thrown away before a file ever exists. Scrolling capture stitches a full page; window capture gets a real shadow and a transparent background; the cursor can be hidden, and the desktop icons with it.

Recording covers screen and camera to MP4 or GIF, with keystrokes shown on screen and clicks highlighted — the features that make a short how-to clip legible without editing it.

## Notes

- The annotation tools are where the time is saved: arrows, blurring for anything sensitive, step counters, and text that stays editable until export.
- Captures can go straight to CleanShot Cloud for a link. That is an upload to someone else's server — fine for a screenshot of a bug, not for anything with credentials on it.
- Sold as a one-off licence with a year of updates, and also included in [Setapp](https://setapp.com/).

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Shottr](/software/media/shottr/) | Freemium | Most of the screenshot half, free, much smaller |
| `⌘⇧5` and Preview | Built in | Captures and basic markup, no overlay workflow |
| [Screen Studio](/software/media/screen-studio/) | Paid | Better recordings, no screenshot workflow to speak of |
| [Snagit](https://www.techsmith.com/screen-capture.html) | Paid | The Windows-era incumbent, heavier and cross-platform |
| [Flameshot](https://flameshot.org/) | Open source | The free annotation-first option, and clumsier on a Mac |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask cleanshot
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://cleanshot.com/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://cleanshot.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/cleanshot" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://cleanshot.com/help" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
