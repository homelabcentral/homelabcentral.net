---
title: "GNU ddrescue"
weight: 1
description: "Image a failing disk, resumably, sector by sector."
---

{{< lead >}}The first thing to run on a dying drive: copy what is still readable, keep a map, and come back for the rest.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/ddrescue" >}}

## What it does

`ddrescue` copies a block device to an image file, reading the easy areas fast and the damaged ones slowly, and recording exactly what succeeded in a mapfile. Interrupt it, unplug the drive, come back tomorrow — point it at the same mapfile and it resumes where it stopped instead of grinding over the good sectors again.

```shell
diskutil unmountDisk /dev/disk4
ddrescue -f -n /dev/rdisk4 failing.img failing.map    # first pass, no retries
ddrescue -d -f -r3 /dev/rdisk4 failing.img failing.map # then retry the bad areas
```

Recover from `failing.img` afterwards with [TestDisk & PhotoRec](/software/recovery/testdisk/) or [foremost](/software/recovery/foremost/). The original disk gets read once and then left alone.

{{< callout type="warning" >}}
The output argument comes second and is written to. Reversing the two overwrites the disk you were trying to save, and there is no confirmation prompt. Check `diskutil list` immediately before running it.
{{< /callout >}}

## Notes

- Use the raw device (`/dev/rdisk4`, not `/dev/disk4`) on macOS — it is unbuffered and markedly faster.
- Not the same project as `dd_rescue`. The mapfile, the two-phase strategy and the direct-access flags are what make this one the standard.
- A mechanical drive making noises has a limited number of reads left in it. First pass, no retries, always.

## Alternative to

{{< borderless-table >}}
| Alternative                                     | Type        | Trade-off                                                                    |
| ----------------------------------------------- | ----------- | ---------------------------------------------------------------------------- |
| `dd`                                            | Built in    | Stops at the first read error and cannot resume                              |
| [Disk Drill](/software/recovery/disk-drill/)    | Freemium    | Its byte-to-byte backup does the same job behind a window, with less control |
| [HDDSuperClone](https://www.hddsuperclone.com/) | Open source | Goes further with damaged drives, including a direct ATA mode                |
| [Parted Magic](/software/erase/parted-magic/)   | Paid        | Ships this and the rest of the toolkit on a bootable stick                   |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install ddrescue
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.gnu.org/software/ddrescue/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/ddrescue" title="Homebrew formula" icon="cube" subtitle="Formula definition and versions" >}}
{{< card link="https://www.gnu.org/software/ddrescue/manual/ddrescue_manual.html" title="Manual" icon="book-open" subtitle="Mapfiles and pass strategy" >}}
{{< /cards >}}
