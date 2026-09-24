---
title: "The Unarchiver"
weight: 1
description: "Extracts almost every archive format."
---

{{< lead >}}Registers itself for every archive type macOS cannot open and extracts them on double-click.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/the-unarchiver" >}} {{< badge content="Mac App Store" color="purple" icon="shopping-bag" link="https://apps.apple.com/us/app/the-unarchiver/id425424353" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://theunarchiver.com/" >}}

## What it does

The Unarchiver handles RAR (including multi-part), 7z, StuffIt, LZH, ARJ, ACE, ISO, BIN, split archives and dozens of legacy formats, and it gets filename encoding right — the reason non-Latin filenames from old Windows archives come out readable instead of as mojibake.

It has no real interface. Set which extensions it claims once, and from then on double-clicking works.

## Notes

Extraction only; it does not create archives. For that, Finder's own **Compress** produces ZIP, and `p7zip` or PeaZip cover the rest.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Keka](https://www.keka.io/) | Open source | Also free, and it creates archives as well as extracting them |
| [BetterZip](https://macitbetter.com/) | Paid | Archive previewing and editing |
| Archive Utility | Built in | Built into macOS; handles ZIP and tarballs and little else |
| [PeaZip](/software/files/peazip/) | Open source | Heavier, but covers encryption and 200-plus formats |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask the-unarchiver
```

{{< /tab >}}
{{< tab name="Mac App Store" >}}

Also available free: [The Unarchiver on the Mac App Store](https://apps.apple.com/us/app/the-unarchiver/id425424353)

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://theunarchiver.com/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://theunarchiver.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/the-unarchiver" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
