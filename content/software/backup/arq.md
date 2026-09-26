---
title: "Arq"
weight: 3
description: "Versioned, encrypted backups to storage you already pay for."
---

{{< lead >}}Backs up to your own bucket — S3, B2, Wasabi, a NAS, a folder — encrypted before it leaves.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/arq" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.arqbackup.com/download/" >}}

## What it does

Schedules deduplicated, client-side-encrypted backups to almost any destination: object storage, SFTP, SMB, a local disk, or Arq's own hosted storage. Keeps versions, restores single files or whole folders, and can back up to several destinations at once.

The appeal over a subscription service is that the destination is yours. Cancel the software and the data is still readable with Arq's documented, open format and a restore tool.

## Notes

- Sold as a one-off licence with a year of updates, or as a subscription that bundles storage. The licence does not expire when updates do.
- Does not make a bootable copy. Pair it with [Carbon Copy Cloner](/software/backup/carbon-copy-cloner/) or [SuperDuper!](/software/backup/superduper/) if you want one.

## Alternative to

{{< borderless-table >}}
| Alternative                                                              | Type         | Trade-off                                                            |
| ------------------------------------------------------------------------ | ------------ | -------------------------------------------------------------------- |
| [Backblaze Personal Backup](https://www.backblaze.com/cloud-backup.html) | Subscription | Unlimited storage for a flat fee, but only their cloud               |
| [restic](/software/backup/restic/)                                       | Open source  | Same model from the command line, free, no scheduler of its own      |
| [Kopia](/software/backup/kopia/)                                         | Open source  | Comparable features with a GUI, less polished                        |
| [Duplicati](https://www.duplicati.com/)                                  | Open source  | Free and cross-platform; slower, and the web UI is an acquired taste |
| [Time Machine](https://support.apple.com/en-us/104984)                   | Built in     | Local and effortless, but not off-site                               |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask arq
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.arqbackup.com/download/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.arqbackup.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/arq" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://www.arqbackup.com/documentation/" title="Documentation" icon="book-open" subtitle="Formats, destinations, restores" >}}
{{< /cards >}}
