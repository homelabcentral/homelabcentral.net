---
title: "TestDisk & PhotoRec"
weight: 2
description: "Rebuild lost partitions, then carve files without one."
---

{{< lead >}}Two tools in one formula: one puts the partition table back, the other ignores it entirely.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/testdisk" >}}

## What it does

**TestDisk** finds partitions that are still on the disk but no longer in the partition table, and can write the table back — the fix for a volume that vanished after a bad `diskutil` command or a failed resize. It also repairs FAT and NTFS boot sectors and undeletes from several filesystems.

**PhotoRec** gives up on the filesystem and carves: it scans the device for known file signatures and writes out everything it recognises, hundreds of formats deep. Filenames and directories are gone — you get `f0012345.jpg` — but the contents come back.

```shell
sudo photorec /dev/rdisk4          # or point it at an image from ddrescue
sudo testdisk /dev/rdisk4
```

## Notes

- Both are terminal programs with a full-screen menu interface. Ugly, keyboard-driven, and the reference implementation the commercial tools are measured against.
- Always work from an image if the disk is failing — see [GNU ddrescue](/software/recovery/ddrescue/). Both tools accept an image file in place of a device.
- Recovery onto the same disk you are recovering from overwrites the data you are trying to read. Write somewhere else.

{{< callout type="info" >}}
On an Apple Silicon Mac the internal disk is encrypted by the Secure Enclave and trimmed aggressively. Carving deleted files off it generally does not work, and nothing else will do better — this is a case for having had a backup.
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative                                    | Type         | Trade-off                                                                      |
| ---------------------------------------------- | ------------ | ------------------------------------------------------------------------------ |
| [Disk Drill](/software/recovery/disk-drill/)   | Freemium     | Previews what it found before you pay, and shows original filenames more often |
| [Data Rescue](/software/recovery/data-rescue/) | Subscription | Commercial support and a cleaner report, on a subscription                     |
| [Recuva](https://www.ccleaner.com/recuva)      | Freemium     | The usual Windows recommendation; no macOS build                               |
| [foremost](/software/recovery/foremost/)       | Open source  | Carving only, scriptable, far fewer formats                                    |
| [R-Studio](https://www.r-studio.com/)          | Paid         | Deeper RAID and network recovery, priced accordingly                           |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install testdisk
```

PhotoRec ships in the same formula.

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from CGSecurity](https://www.cgsecurity.org/wiki/TestDisk_Download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.cgsecurity.org/wiki/TestDisk" title="TestDisk" icon="globe-alt" subtitle="Partition recovery" >}}
{{< card link="https://www.cgsecurity.org/wiki/PhotoRec" title="PhotoRec" icon="photograph" subtitle="File carving" >}}
{{< card link="https://formulae.brew.sh/formula/testdisk" title="Homebrew formula" icon="cube" subtitle="Formula definition and versions" >}}
{{< card link="https://www.cgsecurity.org/testdisk.pdf" title="Step by step" icon="book-open" subtitle="The official walkthrough" >}}
{{< /cards >}}
