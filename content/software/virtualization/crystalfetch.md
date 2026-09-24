---
title: "CrystalFetch"
weight: 2
description: "Build a Windows installer ISO on macOS."
---

{{< lead >}}Downloads official Windows images from Microsoft's UUP servers and assembles an ISO, including ARM64.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/crystalfetch" >}} {{< badge content="Mac App Store" color="purple" icon="shopping-bag" link="https://apps.apple.com/us/app/crystalfetch-iso-downloader/id6454431289" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/TuringSoftware/CrystalFetch/releases" >}}

## What it does

Microsoft does not publish Windows-on-ARM ISOs the way it does x86 ones. CrystalFetch talks to the UUP (Unified Update Platform) servers, fetches the official packages for a chosen build, edition and language, and assembles them into a bootable ISO locally.

That is what makes a Windows 11 ARM64 guest in UTM straightforward — the two apps come from the same developer and are designed to be used together.

## Notes

- Everything downloaded comes from Microsoft's own servers; CrystalFetch only assembles it.
- Assembly needs several tens of gigabytes of free space during the process.
- A Windows licence is still required to activate the result.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [UUP dump](https://uupdump.net/) | Free | The website CrystalFetch drives; the same files, assembled by hand |
| [Microsoft's Media Creation Tool](https://www.microsoft.com/software-download/windows11) | Free | Official, but Windows-only and x86-only |
| [Mist](/software/maintenance/mist/) | Open source | The equivalent tool for macOS installers rather than Windows |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask crystalfetch
```

{{< /tab >}}
{{< tab name="Mac App Store" >}}

Also on the App Store: [CrystalFetch on the Mac App Store](https://apps.apple.com/us/app/crystalfetch-iso-downloader/id6454431289)

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/TuringSoftware/CrystalFetch/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/TuringSoftware/CrystalFetch" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/crystalfetch" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/TuringSoftware/CrystalFetch" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
