---
title: "SuperDuper!"
weight: 2
description: "Bootable copies, and Smart Update to keep them current."
---

{{< lead >}}Makes a startable copy of your Mac on an external disk, and can do it for free.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/superduper" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html" >}}

## What it does

Copies a volume to another volume, in one pass, with a plain-English description of what it is about to do before it does it. Unlicensed it still makes full copies; a licence adds Smart Update, scheduling and unattended runs on your own Macs.

Smart Update is the feature worth paying for: it compares both sides and copies only differences, then deletes what no longer exists on the source. Minutes instead of hours, and far less written to the SSD.

## Notes

- Same platform limits as every cloner: the system volume goes through Apple's `asr`, and a bootable result on Apple Silicon is not guaranteed.
- No snapshot retention. A copy is the current state and nothing older, which is why it pairs with a versioned tool rather than replacing one.

## Alternative to

{{< borderless-table >}}
| Alternative                                                | Type        | Trade-off                                                            |
| ---------------------------------------------------------- | ----------- | -------------------------------------------------------------------- |
| [Carbon Copy Cloner](/software/backup/carbon-copy-cloner/) | Paid        | Snapshot retention, richer scheduling, no free tier                  |
| [Time Machine](https://support.apple.com/en-us/104984)     | Built in    | Versioned history, but the result does not boot                      |
| `asr`                                                      | Built in    | The replication engine both of these drive, with no interface at all |
| [Clonezilla](/software/backup/clonezilla/)                 | Open source | Images any disk from a USB stick, but not the running Mac            |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask superduper
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/superduper" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://www.shirt-pocket.com/faq-superduper4.php" title="FAQ" icon="question-mark-circle" subtitle="What the licence unlocks" >}}
{{< /cards >}}
