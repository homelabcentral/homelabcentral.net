---
title: "Mounty for NTFS"
weight: 7
description: "Remount a read-only NTFS volume as writable."
---

{{< lead >}}A menu bar helper that flips an NTFS drive from read-only to read-write.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/mounty" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://mounty.app/" >}}

## What it does

macOS mounts NTFS volumes read-only. The kernel *can* write NTFS, but Apple does not enable it. Mounty unmounts the volume and remounts it with the write flag set, from a menu bar item or a notification when a drive is plugged in.

For moving files to a drive shared with a Windows machine occasionally, that is far less invasive than installing a FUSE-based driver.

{{< callout type="warning" >}}
Apple's NTFS write support is undocumented and not officially supported. It is fine for copying files; it is not something to trust with the only copy of important data, and an unclean unmount can leave the volume needing `chkdsk` on Windows. Always eject properly, and for a drive shared between systems regularly, use exFAT instead.
{{< /callout >}}

## Notes

Free. It does not work on volumes that are already dirty — Windows has to repair those first.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Paragon NTFS for Mac](https://www.paragon-software.com/home/ntfs-mac/) or [Tuxera NTFS](https://ntfsformac.tuxera.com/) | Paid | Fully supported NTFS write drivers |
| ntfs-3g with macFUSE | Open source | Needs a kernel extension |
| exFAT | Built in | Reformat the drive and the problem disappears for both operating systems |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask mounty
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://mounty.app/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://mounty.app/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/mounty" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
