---
title: "diskutil secureErase"
weight: 1
description: "The built-in overwrite, and Apple's own warning about it."
---

{{< lead >}}macOS ships a multi-pass overwrite, and its own manual tells you not to trust it.{{< /lead >}}

{{< badge content="Built in" color="gray" icon="iconify:bi/apple" size="lg" link="https://support.apple.com/guide/disk-utility/erase-and-reformat-a-storage-device-dskutl14079/mac" >}}

## What it does

`diskutil secureErase` overwrites a whole disk, or just the free space on a mounted volume, with a choice of patterns:

```shell
diskutil list                              # identify the disk, carefully
diskutil secureErase 1 /dev/disk4          # single-pass random fill
diskutil secureErase freespace 0 /Volumes/Archive
```

Levels are `0` zero fill, `1` random fill, `2` seven passes, `3` the 35-pass Gutmann algorithm, `4` three passes. Levels 2 to 4 take an extremely long time and buy nothing on any drive made this century.

{{< callout type="warning" >}}
The disk argument is destroyed without a confirmation prompt, and a whole-disk erase leaves it unpartitioned and unusable until you partition it again. Check the identifier with `diskutil list` immediately beforehand — identifiers move when you plug something in.
{{< /callout >}}

## Notes

Apple's own manual page is blunt about the limits, and it is worth quoting rather than paraphrasing:

> This kind of secure erase is no longer considered safe. Modern devices have wear-leveling, block-sparing, and possibly-persistent cache hardware, which cannot be completely erased by these commands. The modern solution for quickly and securely erasing your data is encryption.

So:

- **Internal storage on an Apple Silicon Mac** is already encrypted by the Secure Enclave. **System Settings → General → Transfer or Reset → Erase All Content and Settings** discards the keys, which is instant and complete. That is the supported way to retire a Mac.
- **An external SSD** is best encrypted from the day you start using it — then erasing the volume ends the story. Failing that, the drive's own firmware sanitise command is the only thing that reaches spare blocks; see [Parted Magic](/software/erase/parted-magic/).
- **A mechanical disk** has no wear levelling worth worrying about, and a single overwrite pass really is enough. This command is fine for those.

## Alternative to

{{< borderless-table >}}
| Alternative                                             | Type        | Trade-off                                                                    |
| ------------------------------------------------------- | ----------- | ---------------------------------------------------------------------------- |
| Erase All Content and Settings                          | Built in    | Instant and complete, but only for the Mac's own internal disk               |
| [ShredOS](/software/erase/shredos/)                     | Open source | Boots from a stick, wipes disks the running system is using, logs the result |
| [Parted Magic](/software/erase/parted-magic/)           | Paid        | Issues the drive's firmware sanitise command instead of overwriting it       |
| [dcfldd](/software/erase/dcfldd/)                       | Open source | Scriptable patterns and a hash of what was written                           |
| `shred` from [coreutils](/software/terminal/coreutils/) | Open source | Per-file rather than per-disk, and just as defeated by wear levelling        |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Built in" selected=true >}}

Nothing to install — `diskutil` ships with macOS. The full documentation is in the manual page:

```shell
man diskutil
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://support.apple.com/guide/disk-utility/erase-and-reformat-a-storage-device-dskutl14079/mac" title="Disk Utility guide" icon="globe-alt" subtitle="Apple's erase documentation" >}}
{{< card link="https://support.apple.com/en-us/102664" title="Erase All Content and Settings" icon="trash" subtitle="The supported way to retire a Mac" >}}
{{< /cards >}}
