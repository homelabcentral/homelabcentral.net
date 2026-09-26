---
title: "Clonezilla"
weight: 8
description: "Bootable disk and partition imaging for the rest of the rack."
---

{{< lead >}}A bootable USB stick that images whole disks block by block — for the machines a Mac backup tool will not touch.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://clonezilla.org/downloads.php" >}}

## What it does

Clonezilla Live boots a small Linux environment whose only job is copying disks: disk to disk, disk to image, partition to partition, to a local drive or over SSH, Samba or NFS. It reads the filesystem where it can — ext4, XFS, NTFS, FAT, APFS and others — and copies only used blocks, falling back to a full sector copy for anything it does not recognise.

Nothing runs on the machine being imaged, which is the point: the disk is offline and consistent while it is copied.

## Notes

- Officially x86 and x86-64. The experimental arm64 builds are not tested against Apple Silicon, and an Apple Silicon Mac will not boot it — this is a tool for Intel Macs and for the PCs, hypervisor hosts and NAS boxes beside them.
- APFS is recognised for cloning, but restoring a macOS system volume to bootability is not something to rely on. Use [Carbon Copy Cloner](/software/backup/carbon-copy-cloner/) or [SuperDuper!](/software/backup/superduper/) for Macs.
- Write the ISO to a stick with [balenaEtcher](/software/maintenance/balenaetcher/) or [macUSB](/software/maintenance/macusb/).
- Clonezilla SE is the same engine as a server, imaging a room full of machines over the network at once.

## Alternative to

{{< borderless-table >}}
| Alternative                                                | Type        | Trade-off                                                                    |
| ---------------------------------------------------------- | ----------- | ---------------------------------------------------------------------------- |
| [Macrium Reflect](https://www.macrium.com/)                | Paid        | The Windows standard, with a scheduler; nothing to run on macOS              |
| [Rescuezilla](https://rescuezilla.com/)                    | Open source | The same engine behind a graphical interface, and it reads Clonezilla images |
| [Carbon Copy Cloner](/software/backup/carbon-copy-cloner/) | Paid        | For Macs specifically, and it runs while the Mac is running                  |
| [Parted Magic](/software/erase/parted-magic/)              | Paid        | A wider rescue toolkit on the same kind of stick                             |
| `dd`                                                       | Built in    | Copies any disk to any file, with no filesystem awareness and no seatbelt    |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Bootable USB" selected=true >}}

Download the ISO, then write it to a stick:

```shell
brew install --cask balenaetcher
```

Select the Clonezilla ISO, select the USB device, flash. Boot the target machine from it — on a Mac, hold **Option** at startup.

{{< /tab >}}
{{< tab name="Ventoy" >}}

Copy the `.iso` onto a [Ventoy](https://www.ventoy.net/) stick and pick it from the boot menu. One stick, many rescue images, no reflashing.

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://clonezilla.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://clonezilla.org/downloads.php" title="Downloads" icon="download" subtitle="ISO and zip images" >}}
{{< card link="https://clonezilla.org/clonezilla-live-doc.php" title="Documentation" icon="book-open" subtitle="Live usage guides" >}}
{{< /cards >}}
