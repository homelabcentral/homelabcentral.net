---
title: "rclone"
weight: 7
description: "Sync and encrypt to sixty-odd cloud providers."
---

{{< lead >}}rsync for object storage: one tool that speaks S3, B2, Drive, Dropbox, SFTP and dozens more.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/rclone" >}}

## What it does

Copies, syncs and moves files between any two configured remotes, with checksums, bandwidth limits and a dry-run mode. `rclone mount` exposes a remote as a local filesystem, and the `crypt` wrapper encrypts names and contents before upload so the provider stores nothing readable.

```shell
rclone config                       # interactive, once per remote
rclone sync ~/Documents b2:my-bucket/documents --progress --dry-run
rclone mount gdrive: ~/mnt/gdrive --vfs-cache-mode writes
```

## Notes

- `sync` makes the destination match the source, deletions included. Run it with `--dry-run` first, every time.
- It mirrors rather than versions: yesterday's file is gone once today's sync runs. For history, back up with [restic](/software/backup/restic/) — which can use an rclone remote as its backend — and keep rclone for moving bulk data.
- `mount` needs a FUSE implementation; see [macFUSE](/software/files/macfuse/).

## Alternative to

{{< borderless-table >}}
| Alternative                          | Type        | Trade-off                                                |
| ------------------------------------ | ----------- | -------------------------------------------------------- |
| [rsync](/software/networking/rsync/) | Open source | The same shape for SSH hosts rather than cloud storage   |
| [Cyberduck](https://cyberduck.io/)   | Open source | A window with files in it, rather than a scriptable tool |
| [restic](/software/backup/restic/)   | Open source | Versioned snapshots, not a mirror                        |
| [Syncthing](https://syncthing.net/)  | Open source | Continuous peer-to-peer sync, no cloud account anywhere  |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install rclone
```

{{< /tab >}}
{{< tab name="Install script" >}}

```shell
curl https://rclone.org/install.sh | sudo bash
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://rclone.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/rclone" title="Homebrew formula" icon="cube" subtitle="Formula definition and versions" >}}
{{< card link="https://rclone.org/docs/" title="Documentation" icon="book-open" subtitle="Flags, remotes, crypt" >}}
{{< card link="https://github.com/rclone/rclone" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
