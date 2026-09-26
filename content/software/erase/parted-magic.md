---
title: "Parted Magic"
weight: 4
description: "Drive-firmware sanitise for ATA, NVMe, SAS and eMMC."
---

{{< lead >}}A paid bootable toolkit whose erase program asks the drive to wipe itself, which is the only overwrite that reaches every cell.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://partedmagic.com/store/" >}}

## What it does

Parted Magic is a Linux live image carrying GParted, ddrescue, TestDisk, benchmarking and disk-health tools, and its own Erase program. That program identifies each attached drive and picks the correct method for it — ATA Secure Erase, ATA Sanitize, NVMe Format, NVMe Sanitize, SAS and eMMC equivalents — rather than blindly writing zeroes over the top.

That distinction is the reason to pay for it. An overwrite from the host cannot address spare blocks or an SSD's over-provisioned area; a firmware sanitise command runs inside the controller and can.

## Notes

- Sold as a one-off download of a single release, or as a subscription that keeps giving you newer ones. Not free, and honest about it.
- Follows the current NIST media-sanitisation guidance, and prints a report you can keep.
- x86-64 boot media, so: Intel Macs and PCs. An Apple Silicon Mac cannot boot it.
- The same image is a competent rescue environment, which makes it less annoying to pay for.

## Alternative to

{{< borderless-table >}}
| Alternative                                                                                                                                       | Type        | Trade-off                                                                |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- | ------------------------------------------------------------------------ |
| [ShredOS](/software/erase/shredos/)                                                                                                               | Open source | Free, and can issue sanitise commands, with a narrower toolkit around it |
| [Samsung Magician](https://semiconductor.samsung.com/consumer-storage/magician/)                                                                  | Free        | Secure erase for Samsung drives only, and Windows only                   |
| [WD Dashboard](https://support-en.wd.com/app/answers/detailweb/a_id/31759) or [SanDisk SSD Dashboard](https://shop.sandisk.com/support/downloads) | Free        | Same deal for WD and SanDisk drives; Windows only, one vendor each       |
| [Seagate SeaTools](https://www.seagate.com/support/downloads/seatools/)                                                                           | Free        | Diagnostics first, erase second; Seagate drives                          |
| [diskutil secureErase](/software/erase/diskutil-secure-erase/)                                                                                    | Built in    | Free and already installed, and cannot reach the firmware at all         |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Bootable USB" selected=true >}}

Buy and download the ISO, then write it to a stick:

```shell
brew install --cask balenaetcher
```

Boot the target machine from the stick — on an Intel Mac, hold **Option** at startup.

{{< /tab >}}
{{< tab name="Ventoy" >}}

Drop the ISO onto a [Ventoy](https://www.ventoy.net/) stick with your other rescue images.

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://partedmagic.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://partedmagic.com/store/" title="Store" icon="download" subtitle="Download and licensing" >}}
{{< card link="https://partedmagic.com/news/" title="Release notes" icon="book-open" subtitle="What each release changed" >}}
{{< /cards >}}
