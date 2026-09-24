---
title: "DaVinci Resolve"
weight: 1
description: "Professional non-linear editor, colour grading and audio post."
---

{{< lead >}}Blackmagic's full post-production suite — edit, colour, VFX and audio in one application.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.blackmagicdesign.com/products/davinciresolve" >}}

## What it does

Resolve began as a colour grading system and grew into a complete post-production application. It is organised as pages rather than modes:

- **Cut** and **Edit** — two editors, one built for speed and one for precision.
- **Fusion** — node-based compositing and motion graphics.
- **Color** — the node-based grading system Resolve is still best known for.
- **Fairlight** — a full DAW for audio post.
- **Deliver** — render queue and encoding.

The free version is genuinely complete for most work. Resolve Studio adds hardware-accelerated H.264/265 encoding, some noise reduction and effects, and multi-user collaboration.

## Notes

- Not in Homebrew — Blackmagic distributes it behind a registration form on their support site.
- Install **Blackmagic RAW** if you shoot BRAW, and use **Blackmagic Proxy Generator Lite** to keep timelines responsive with camera-original footage.
- The free macOS build relies on system codecs, so anything exotic is worth transcoding with `ffmpeg` to ProRes or DNxHR first.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Adobe Premiere Pro](https://www.adobe.com/products/premiere.html) | Subscription | The industry-standard NLE, subscription only |
| [Final Cut Pro](https://www.apple.com/final-cut-pro/) | Paid | A one-off purchase, the fastest editor on Apple Silicon |
| [Avid Media Composer](https://www.avid.com/media-composer) | Subscription | Still the standard in scripted television and film |
| [Adobe After Effects](https://www.adobe.com/products/aftereffects.html) | Subscription | The alternative to Resolve's Fusion page |
| [Avid Pro Tools](https://www.avid.com/pro-tools) | Subscription | The alternative to its Fairlight page |
| [Kdenlive](https://kdenlive.org/), [Shotcut](https://shotcut.org/) or [CapCut](https://www.capcut.com/) | Open source / Freemium | Far lighter, for simple cuts |
{{< /borderless-table >}}

## Install

[Blackmagic support downloads](https://www.blackmagicdesign.com/products/davinciresolve)

## Links

{{< cards cols="2" >}}
{{< card link="https://www.blackmagicdesign.com/products/davinciresolve" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://www.blackmagicdesign.com/products/davinciresolve/training" title="Documentation" icon="book-open" subtitle="Official training and manuals" >}}
{{< card link="https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion" title="Support downloads" icon="download" subtitle="Every version, including older builds" >}}
{{< /cards >}}
