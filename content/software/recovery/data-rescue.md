---
title: "Data Rescue"
weight: 4
description: "Long-standing commercial recovery for macOS."
---

{{< lead >}}Prosoft's recovery suite: deep scans, a clone-first workflow, and a licence you rent rather than buy.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/data-rescue" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.prosofteng.com/download-data-rescue-6-mac" >}}

## What it does

Scans a volume or a disk image for recoverable files, with a quick pass over the filesystem and a deep pass that carves by content, then lets you sort and filter results before recovering. It will clone a failing disk to an image first and scan the image, which is the right order of operations.

It has been the commercial Mac name in this space for two decades, which mostly buys you a support contact and a familiar report.

## Notes

- Licensed as a subscription — a short-term standard licence or an annual professional one. There is no perpetual key.
- The trial scans fully and recovers a small allowance, enough to confirm the files are actually there.
- Recovery goes to a different volume, as always.

## Alternative to

{{< borderless-table >}}
| Alternative                                         | Type        | Trade-off                                                   |
| --------------------------------------------------- | ----------- | ----------------------------------------------------------- |
| [Disk Drill](/software/recovery/disk-drill/)        | Freemium    | Unlimited preview before paying, and a perpetual option     |
| [TestDisk & PhotoRec](/software/recovery/testdisk/) | Open source | No licence at all; you supply the patience                  |
| [DiskWarrior](https://www.alsoft.com/diskwarrior)   | Paid        | Directory rebuilding rather than file carving, and HFS+ era |
| [R-Studio](https://www.r-studio.com/)               | Paid        | RAID reconstruction and network recovery                    |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask data-rescue
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.prosofteng.com/download-data-rescue-6-mac)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.prosofteng.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/data-rescue" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://www.prosofteng.com/data-recovery-software" title="Product page" icon="book-open" subtitle="Editions and licensing" >}}
{{< /cards >}}
