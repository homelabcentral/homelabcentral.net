---
title: "BorgBackup"
weight: 5
description: "Deduplicating archives, compressed and authenticated."
---

{{< lead >}}Deduplicating, compressed, authenticated-encryption archives — the conservative choice for a backup repository.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/borgbackup" >}}

## What it does

`borg create` writes an archive into a repository, chunking and deduplicating as it goes, so the hundredth archive of the same tree adds only what changed. Archives can be mounted with FUSE and browsed like a directory, which makes restores unremarkable.

```shell
borg init --encryption=repokey-blake2 nas:/backups/laptop
borg create --stats --compression zstd nas:/backups/laptop::{now} ~/Documents
borg mount nas:/backups/laptop::latest /tmp/borgmount
```

## Notes

- Needs Borg installed on both ends for a remote repository, which rules out plain object storage. [Borgbase](https://www.borgbase.com/) and [rsync.net](https://rsync.net/products/borg.html) exist for exactly that reason.
- Mounting archives needs a FUSE implementation — see [macFUSE](/software/files/macfuse/).
- One repository is written by one client at a time. Concurrent hosts want separate repositories.

## Alternative to

{{< borderless-table >}}
| Alternative                               | Type        | Trade-off                                                         |
| ----------------------------------------- | ----------- | ----------------------------------------------------------------- |
| [restic](/software/backup/restic/)        | Open source | Talks to object storage directly; no daemon needed on the far end |
| [Kopia](/software/backup/kopia/)          | Open source | GUI and policies included, and it does speak S3                   |
| [Duplicity](https://duplicity.gitlab.io/) | Open source | Older, incremental rather than deduplicating, GnuPG-based         |
| [Arq](/software/backup/arq/)              | Paid        | The same guarantees with a scheduler and a licence                |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install borgbackup
```

{{< /tab >}}
{{< tab name="pip" >}}

```shell
pip install borgbackup
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.borgbackup.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/borgbackup" title="Homebrew formula" icon="cube" subtitle="Formula definition and versions" >}}
{{< card link="https://borgbackup.readthedocs.io/" title="Documentation" icon="book-open" subtitle="Quick start and internals" >}}
{{< card link="https://github.com/borgbackup/borg" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
