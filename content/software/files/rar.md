---
title: "RAR / UnRAR"
weight: 4
description: "RARLAB's official command-line RAR tools."
---

{{< lead >}}The only tools that *create* RAR archives, plus the reference extractor.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/rar" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.rarlab.com/download.htm" >}}

## What it does

Installs `rar` and `unrar` from RARLAB. `unrar` extracts anything, including recovery records and multi-part sets; `rar` creates archives, which no open-source implementation can do — the compression format is proprietary and only decompression has been reverse-engineered.

```shell
unrar x archive.rar
unrar l archive.rar
rar a -m5 -v100m archive.rar folder/   # max compression, 100 MB volumes
```

## Notes

RAR is shareware: `unrar` is free to use, `rar` is licensed after a trial period. In practice there is little reason to *create* RAR archives today — 7z compresses comparably and is unencumbered. Keep this for reading what other people send.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [7z](/software/files/p7zip/) | Open source | Comparable ratios, an open format, and no licence to think about |
| [Keka](https://www.keka.io/) or [The Unarchiver](/software/files/the-unarchiver/) | Open source / Free | Extract RAR without installing RARLAB's tools |
| Nothing else writes RAR | — | The format is proprietary; only RARLAB's `rar` can create the archives |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask rar
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.rarlab.com/download.htm)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.rarlab.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/rar" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
