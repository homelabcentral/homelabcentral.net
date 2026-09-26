---
title: "dcfldd"
weight: 5
description: "dd with patterns, hashing and a progress meter."
---

{{< lead >}}A forensic fork of `dd`: writes a pattern across a disk, hashes as it goes, and tells you how far it has got.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/dcfldd" >}}

## What it does

Everything `dd` does, plus the things that make it usable for wiping and imaging: a repeating write pattern, on-the-fly hashing of what was read or written, a progress display, split output files, and a verify pass against the source.

```shell
diskutil unmountDisk /dev/disk4
sudo dcfldd pattern=00 of=/dev/rdisk4 statusinterval=64     # single-pass zero fill
sudo dcfldd if=/dev/rdisk4 hash=sha256 hashlog=disk4.sha256 of=disk4.img
```

{{< callout type="warning" >}}
`of=` is written to without confirmation. A wrong identifier overwrites the wrong disk, and `sudo` means nothing will stop you. Confirm with `diskutil list` first, every time.
{{< /callout >}}

## Notes

- The hash log is what makes it forensic rather than merely convenient: you can prove the image matches the disk, or that the wipe wrote what it claimed.
- Same limitation as every host-side overwrite — wear levelling keeps spare blocks out of reach. For an SSD, a firmware sanitise or key destruction is the real answer.
- Use the raw device (`/dev/rdisk4`) for speed.

## Alternative to

{{< borderless-table >}}
| Alternative                                                    | Type        | Trade-off                                                                |
| -------------------------------------------------------------- | ----------- | ------------------------------------------------------------------------ |
| `dd`                                                           | Built in    | Already installed, no patterns, no hashing, no progress                  |
| [diskutil secureErase](/software/erase/diskutil-secure-erase/) | Built in    | Knows about macOS volumes, offers canned pass counts, no hashing         |
| [GNU ddrescue](/software/recovery/ddrescue/)                   | Open source | The tool for reading failing disks rather than writing over healthy ones |
| [ShredOS](/software/erase/shredos/)                            | Open source | Wipes every disk in a machine from boot media, with a certificate        |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install dcfldd
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/resurrecting-open-source-projects/dcfldd" title="Repository" icon="github" subtitle="Maintained source" >}}
{{< card link="https://formulae.brew.sh/formula/dcfldd" title="Homebrew formula" icon="cube" subtitle="Formula definition and versions" >}}
{{< /cards >}}
