---
title: "DBAN"
weight: 3
description: "The one everybody remembers, and why not to use it now."
---

{{< lead >}}Darik's Boot and Nuke: the bootable floppy-era wiper that taught everyone the phrase, and which has not been updated since 2015.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://dban.org/" >}}

## What it does

Boots a tiny Linux image, detects the attached drives, and overwrites them with a chosen pattern — zero fill, DoD 5220.22-M, Gutmann, or a quick single pass. Unattended `autonuke` mode wipes everything it finds, which is how a shelf of retired desktops used to get cleared.

It is on this page because you will be recommended it, not because you should use it.

{{< callout type="warning" >}}
DBAN has had no release since 2015. It has no SSD or NVMe support, does not reliably boot on UEFI firmware, and cannot ask a drive to sanitise itself. On an SSD it will report success having missed every spare block. Use [ShredOS](/software/erase/shredos/) instead.
{{< /callout >}}

## Notes

- Still genuinely fine for a mechanical SATA or IDE disk in a BIOS-era machine, which is the one case it was written for.
- The project was acquired commercially; the free download stayed where it was and the development went into a paid product.
- Its wiping engine lives on as nwipe, which is what [ShredOS](/software/erase/shredos/) ships.

## Alternative to

{{< borderless-table >}}
| Alternative                                                            | Type        | Trade-off                                                                   |
| ---------------------------------------------------------------------- | ----------- | --------------------------------------------------------------------------- |
| [ShredOS](/software/erase/shredos/)                                    | Open source | The same idea, maintained, and it understands modern drives                 |
| [Parted Magic](/software/erase/parted-magic/)                          | Paid        | Firmware-level sanitise and a full toolkit, for the price of a coffee round |
| [Blancco Drive Eraser](https://www.blancco.com/products/drive-eraser/) | Paid        | The commercial product the DBAN name was folded into                        |
| [diskutil secureErase](/software/erase/diskutil-secure-erase/)         | Built in    | No boot media, and no help with the disk macOS is running from              |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Bootable USB" selected=true >}}

Download the ISO, then write it to a stick with [balenaEtcher](/software/maintenance/balenaetcher/):

```shell
brew install --cask balenaetcher
```

Boot the target machine from it. On UEFI-only firmware, expect to enable a legacy boot mode — or to give up and use ShredOS.

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://dban.org/" title="Homepage" icon="globe-alt" subtitle="Official site and download" >}}
{{< card link="https://sourceforge.net/projects/dban/" title="SourceForge" icon="download" subtitle="Release history, ending in 2015" >}}
{{< /cards >}}
