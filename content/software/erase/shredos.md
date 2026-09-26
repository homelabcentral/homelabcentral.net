---
title: "ShredOS"
weight: 2
description: "Bootable nwipe, with SSD and NVMe support."
---

{{< lead >}}A bootable stick whose entire purpose is erasing the disks in the machine you booted it on.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/PartialVolume/shredos.x86_64/releases" >}}

## What it does

ShredOS is a minimal Linux image built around **nwipe**, the maintained descendant of the wiping engine DBAN used. It boots on BIOS and UEFI, lists every attached drive, and offers the usual pattern choices — zero fill, random, DoD and Gutmann sequences — plus verification and a PDF certificate of what it erased.

Because it runs from RAM, every internal disk is unmounted and fair game, which is the difference between this and anything you run from inside macOS.

## Notes

- Understands SSDs and NVMe devices rather than pretending they are platters, and can ask the drive to sanitise itself where the firmware supports it.
- Write the image to a stick with [balenaEtcher](/software/maintenance/balenaetcher/) or [macUSB](/software/maintenance/macusb/), or drop it on a [Ventoy](https://www.ventoy.net/) stick.
- x86-64 only. It will not boot on an Apple Silicon Mac — for those, discard the keys instead with [Erase All Content and Settings](/software/erase/diskutil-secure-erase/).
- The certificate matters if you are wiping machines for anyone other than yourself.

## Alternative to

{{< borderless-table >}}
| Alternative                                                            | Type        | Trade-off                                                               |
| ---------------------------------------------------------------------- | ----------- | ----------------------------------------------------------------------- |
| [DBAN](/software/erase/dban/)                                          | Open source | The famous predecessor, abandoned in 2015 and blind to SSDs             |
| [nwipe](https://github.com/martijnvanbrummelen/nwipe)                  | Open source | The same engine as a package, if you already have a Linux live image    |
| [Parted Magic](/software/erase/parted-magic/)                          | Paid        | Firmware sanitise across ATA, NVMe, SAS and eMMC, plus a rescue toolkit |
| [Blancco Drive Eraser](https://www.blancco.com/products/drive-eraser/) | Paid        | Audited certificates for compliance regimes, licensed per drive         |
| [diskutil secureErase](/software/erase/diskutil-secure-erase/)         | Built in    | No USB stick needed, but it cannot touch the running system disk        |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Bootable USB" selected=true >}}

```shell
brew install --cask balenaetcher
```

Download the ShredOS image from the releases page, flash it to a USB device, then boot the target machine from it.

{{< /tab >}}
{{< tab name="Ventoy" >}}

Copy the image onto a [Ventoy](https://www.ventoy.net/) stick alongside your other rescue ISOs and choose it from the boot menu.

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://shredos.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/PartialVolume/shredos.x86_64" title="Repository" icon="github" subtitle="Images and source" >}}
{{< card link="https://github.com/martijnvanbrummelen/nwipe" title="nwipe" icon="fire" subtitle="The wiping engine itself" >}}
{{< /cards >}}
