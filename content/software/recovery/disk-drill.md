---
title: "Disk Drill"
weight: 3
description: "Scan, preview and recover with a native interface."
---

{{< lead >}}Scans a volume, shows you thumbnails of what it can get back, and only then asks for money.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/disk-drill" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.cleverfiles.com/data-recovery-software.html" >}}

## What it does

Point it at a disk and it runs a quick scan for deleted entries and a deep scan that carves by signature, then lists results with previews. It also does the surrounding jobs: a byte-to-byte image of a failing drive before you touch it, S.M.A.R.T. monitoring, and a Recovery Vault that records metadata for deletions that have not happened yet.

The free build on macOS scans and previews without limit, and recovers only files protected in advance by Recovery Vault or Guaranteed Recovery. Everything else needs the paid tier.

## Notes

- The preview is the useful part of the free build: it tells you whether paying would achieve anything before you pay.
- Recover to a different disk than the one being scanned.
- One licence covers macOS and Windows, sold annually or as a perpetual key.

{{< callout type="info" >}}
Same physics as everywhere else in this category: TRIM plus full-disk encryption means deleted files on an internal Apple SSD are usually unrecoverable by any tool. External spinning disks and cards are where these scans earn their keep.
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative                                                                         | Type         | Trade-off                                                          |
| ----------------------------------------------------------------------------------- | ------------ | ------------------------------------------------------------------ |
| [TestDisk & PhotoRec](/software/recovery/testdisk/)                                 | Open source  | Free and at least as capable at carving, with a terminal interface |
| [Data Rescue](/software/recovery/data-rescue/)                                      | Subscription | The older Mac incumbent; subscription only                         |
| [Recuva](https://www.ccleaner.com/recuva)                                           | Freemium     | The equivalent free-tier recommendation on Windows                 |
| [EaseUS Data Recovery Wizard](https://www.easeus.com/mac-data-recovery-software/)   | Freemium     | Comparable, heavier marketing, similar results                     |
| [Stellar Data Recovery](https://www.stellarinfo.com/mac-data-recovery-software.php) | Freemium     | Adds video repair; slower deep scans                               |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask disk-drill
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.cleverfiles.com/data-recovery-software.html)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.cleverfiles.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/disk-drill" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://www.cleverfiles.com/help/" title="Documentation" icon="book-open" subtitle="Scan types and limits" >}}
{{< /cards >}}
