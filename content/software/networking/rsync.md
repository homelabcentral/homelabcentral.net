---
title: "rsync"
weight: 5
description: "Fast incremental file transfer and synchronisation."
---

{{< lead >}}The backup and sync workhorse: copies only what changed, locally or over SSH.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/rsync" >}}

## What it does

rsync compares source and destination and transfers only differing blocks, which makes repeated syncs of a large tree cheap. Over SSH it needs nothing on the far end but rsync itself.

```shell
# mirror a directory to a server, preserving everything
rsync -avh --delete ~/Media/ lab:/srv/media/

# dry run first, always
rsync -avhn --delete ~/Media/ lab:/srv/media/

# resumable, with progress
rsync -avh --partial --info=progress2 big.img lab:/srv/

# snapshot-style backup with hardlinks
rsync -avh --link-dest=../2026-09-23 ~/Documents/ ./2026-09-24/
```

## Why the Homebrew build

macOS shipped an ancient rsync 2.6.9 for years, and now ships an `openrsync` shim; the Homebrew formula is current upstream rsync with the flags scripts written on Linux expect.

{{< callout type="warning" >}}
`--delete` removes files at the destination that no longer exist at the source, and a trailing slash on the source changes whether the directory itself or its contents are copied. Run with `-n` first — that one habit prevents most rsync accidents.
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [rclone](https://rclone.org/) | Open source | The same shape, for cloud storage instead of SSH hosts |
| [Unison](https://github.com/bcpierce00/unison) | Open source | Genuinely bidirectional, which rsync is not |
| [Syncthing](https://syncthing.net/) | Open source | Continuous and peer-to-peer, no scheduled runs |
| [Carbon Copy Cloner](https://bombich.com/) or [Time Machine](https://support.apple.com/en-us/104984) | Paid / Built in | For Mac backups specifically, with snapshots |
{{< /borderless-table >}}

## Install

```shell
brew install rsync
```

## Links

{{< cards cols="2" >}}
{{< card link="https://rsync.samba.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/rsync" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://download.samba.org/pub/rsync/rsync.1" title="Documentation" icon="book-open" subtitle="Manual page" >}}
{{< /cards >}}
