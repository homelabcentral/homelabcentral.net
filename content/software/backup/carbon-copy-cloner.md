---
title: "Carbon Copy Cloner"
weight: 1
description: "Scheduled clones and snapshots, with a bootable copy assistant."
---

{{< lead >}}The long-standing answer to "I want a second disk that is this disk", now with snapshots and proper scheduling.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/carbon-copy-cloner" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://bombich.com/download" >}}

## What it does

CCC copies a volume to another volume on a schedule, keeping the destination an exact match of the source and optionally holding APFS snapshots on both sides, so a file deleted three weeks ago is still retrievable. Task-level filters, pre- and post-flight scripts, email on failure, and a task history that says what actually ran.

Its Legacy Bootable Copy Assistant is the part people come for, and the part with the caveats below.

## Notes

- The macOS system volume can only be duplicated by Apple's own `asr`, which copies whole volume groups and nothing smaller. Every tool in this category is subject to that, not just this one.
- On Apple Silicon a bootable copy is unreliable on USB enclosures and more consistent over Thunderbolt. Treat a bootable clone as a convenience and your data backup as the actual plan.
- An Apple Silicon Mac will not start from an external disk at all if its internal storage has failed: a stub of macOS on the internal drive has to validate the external one first.

{{< callout type="info" >}}
This is why "bootable clone" stopped being the whole strategy on modern Macs. Keep versioned backups as well — see [restic](/software/backup/restic/) or [Arq](/software/backup/arq/).
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative                                                             | Type        | Trade-off                                                                    |
| ----------------------------------------------------------------------- | ----------- | ---------------------------------------------------------------------------- |
| [Time Machine](https://support.apple.com/en-us/104984)                  | Built in    | Already there and versioned, but no clone and little control over scheduling |
| [SuperDuper!](/software/backup/superduper/)                             | Freemium    | Narrower and cheaper; no snapshot retention                                  |
| [ChronoSync](https://www.econtechnologies.com/chronosync/overview.html) | Paid        | Aimed at folder-level sync rules rather than whole volumes                   |
| [Macrium Reflect](https://www.macrium.com/)                             | Paid        | The Windows equivalent; nothing to install on a Mac                          |
| [restic](/software/backup/restic/)                                      | Open source | Versioned and cheap to store, but never bootable                             |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask carbon-copy-cloner
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://bombich.com/download)

{{< /tab >}}
{{< /tabs >}}

Licensed per household, one-off, with paid major upgrades. The trial is fully functional.

## Links

{{< cards cols="2" >}}
{{< card link="https://bombich.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/carbon-copy-cloner" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://support.bombich.com/hc/en-us" title="Knowledge base" icon="book-open" subtitle="Unusually good documentation" >}}
{{< /cards >}}
