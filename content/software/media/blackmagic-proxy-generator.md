---
title: "Blackmagic Proxy Generator Lite"
weight: 2
description: "Watch-folder proxy transcoding for Resolve."
---

{{< lead >}}Watches a folder and automatically generates edit-friendly proxies for anything dropped into it.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion" >}}

## What it does

Proxy Generator monitors one or more watch folders. When new media appears, it transcodes a smaller proxy file alongside the original, in the layout Resolve expects — so opening the project finds the proxies and links them automatically. At delivery, Resolve swaps back to the camera originals.

The point is editing 6K or RAW footage on a laptop without dropped frames, while the export still uses full-quality sources.

## Lite versus full

The **Lite** version is free. The difference from the paid Proxy Generator is 10-bit proxy output, which Lite cannot produce; it also relies on the operating system's own codecs. On macOS that includes ProRes, so ProRes proxies work.

## Notes

Not in Homebrew. It is bundled in the same download area as Resolve on the Blackmagic support site, and is a separate application rather than a Resolve plugin.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| Resolve's own Optimized Media and proxy generation | — | Inside the app, no watch folder |
| [Shutter Encoder](https://www.shutterencoder.com/) | Free | A broad transcoding front end over ffmpeg |
| [EditReady](https://www.hedge.video/editready) | Paid | Built specifically for batch transcode to editing codecs |
| An ffmpeg script with a folder watcher | — | The same thing, assembled yourself |
{{< /borderless-table >}}

## Install

[Blackmagic support downloads](https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion)

## Links

{{< cards cols="2" >}}
{{< card link="https://www.blackmagicdesign.com/products/davinciresolve" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion" title="Support downloads" icon="download" subtitle="Look for Proxy Generator Lite" >}}
{{< /cards >}}
