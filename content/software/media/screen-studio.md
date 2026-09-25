---
title: "Screen Studio"
weight: 7
description: "Screen recorder that edits the recording as it captures it."
---

{{< lead >}}Records a screen and produces something that looks edited, without the editing.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/screen-studio" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://screen.studio/" >}}

## What it does

Screen Studio records the screen along with the cursor's actual path, then rebuilds the result: smooth zooms toward whatever was clicked, eased cursor movement, a rounded window on a background, and camera overlay. None of that is baked in at capture time, so every zoom and cut stays adjustable afterwards.

It is the app that made this a category. A two-minute product clip that would take an hour in a timeline editor takes the length of the recording plus a few tweaks.

## Notes

- Exports to MP4, GIF and a transparent-background MOV; retina capture means a 4K export from a 1440p screen is real resolution rather than upscaling.
- Automatic zoom follows clicks, so a recording made with deliberate, unhurried clicking comes out far better than one made at normal speed.
- Sold as a one-off licence per major version, with a subscription option for continuous updates.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Reframed](/software/media/reframed/) | Free | The same shape of tool from a single developer, newer and rougher |
| [Cap](/software/media/cap/) | Freemium | Open source, with a hosted tier for sharing |
| [CleanShot X](/software/media/cleanshot-x/) | Paid | Records fine, but does not restyle the result |
| [DaVinci Resolve](/software/media/davinci-resolve/) | Freemium | Every one of these moves by hand, on a real timeline |
| `⌘⇧5` | Built in | A plain recording of exactly what was on screen |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask screen-studio
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://screen.studio/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://screen.studio/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/screen-studio" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://help.screen.studio/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
