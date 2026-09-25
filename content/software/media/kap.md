---
title: "Kap"
weight: 9
description: "Open-source screen recorder with a plugin system."
---

{{< lead >}}Records a region of the screen to GIF or MP4, and nothing else.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/kap" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://getkap.co/" >}}

## What it does

Kap draws a resizable capture frame on screen, records what happens inside it, and exports to GIF, MP4, WebM or APNG with the frame rate and dimensions set at export rather than at capture. Trimming happens in the export window; there is no timeline and no zoom effects.

Its distinguishing feature is plugins — small npm packages that add export destinations, so a recording can go straight to a file, a clipboard, or a service, without the app itself growing a cloud.

## Notes

- Built with Electron, which is why it is much larger on disk than [Shottr](/software/media/shottr/) and heavier while recording.
- Development has been quiet for a while. It works, and it is the free option that produces a usable GIF without a command line.
- For GIF quality, exporting to MP4 and running it through [Gifski](/software/media/gifski/) beats Kap's own GIF export.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Cap](/software/media/cap/) | Freemium | The actively developed open-source recorder, with zoom effects |
| [CleanShot X](/software/media/cleanshot-x/) | Paid | Records to GIF directly, and annotates |
| [Reframed](/software/media/reframed/) | Free | Editor built in, native, needs a recent macOS |
| `⌘⇧5` | Built in | Records fine; converting to GIF is then your problem |
| [LICEcap](https://www.cockos.com/licecap/) | Open source | The old minimal GIF recorder, still works, looks it |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask kap
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://getkap.co/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://getkap.co/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/kap" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/wulkano/Kap" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/wulkano/Kap/blob/main/docs/plugins.md" title="Plugins" icon="puzzle" subtitle="Writing and installing export plugins" >}}
{{< /cards >}}
