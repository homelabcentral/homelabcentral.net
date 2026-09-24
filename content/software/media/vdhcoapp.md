---
title: "Video DownloadHelper CoApp"
weight: 10
description: "Native companion for the Video DownloadHelper browser extension."
---

{{< lead >}}The local helper that gave the browser extension file writing and an `ffmpeg` build.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/netdownloadhelpercoapp" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/aclap-dev/vdhcoapp/releases" >}}

## What it does

Browser extensions cannot write arbitrary files or run binaries. The CoApp is a native messaging host that sits behind Video DownloadHelper and provides what the extension cannot do itself: writing downloads to a chosen directory, launching the default player, and a bundled `ffmpeg` for merging streams and converting formats.

## Notes

{{< callout type="info" >}}
The CoApp is no longer developed, and Video DownloadHelper v10 does not need it — the extension handles those jobs itself. If the extension is current, this is a leftover and can be removed.
{{< /callout >}}

The bundle identifier on disk is `net.downloadhelper.coapp`, which is why it shows up in `/Applications` under a name that looks like a mistake.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [yt-dlp](/software/media/yt-dlp/) | Open source | The command-line answer, and better at nearly everything |
| [Downie](https://software.charliemonroe.net/downie/) | Paid | GUI, no extension or companion needed |
| [Video DownloadHelper v10](https://www.downloadhelper.net/) | Freemium | The extension no longer needs a companion app at all |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask netdownloadhelpercoapp
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/aclap-dev/vdhcoapp/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/aclap-dev/vdhcoapp" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/netdownloadhelpercoapp" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/aclap-dev/vdhcoapp" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
