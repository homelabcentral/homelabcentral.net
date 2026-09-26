---
title: "restic"
weight: 5
description: "Deduplicating encrypted snapshots from one binary."
---

{{< lead >}}One static binary, one repository, encrypted snapshots that deduplicate against everything already stored.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/restic" >}}

## What it does

`restic backup` splits files into content-addressed chunks, encrypts them, and writes only the chunks the repository has never seen. A second snapshot of a mostly unchanged home directory costs almost nothing, and every snapshot is a full one to restore from.

Backends include a local path, SFTP, S3-compatible object storage, Backblaze B2, Azure, Google Cloud Storage and rclone — which in practice means anything.

```shell
export RESTIC_REPOSITORY=sftp:nas:/backups/laptop
restic init
restic backup ~/Documents ~/Code
restic snapshots
restic restore latest --target /tmp/restore
```

## Notes

- Repositories are append-only friendly, so a compromised client cannot delete history if the backend is configured for it.
- No scheduler. Drive it from `launchd`, or from a wrapper like [resticprofile](https://github.com/creativeprojects/resticprofile).
- `restic forget --prune` is what reclaims space; without it, snapshots accumulate for ever.

## Alternative to

{{< borderless-table >}}
| Alternative                                    | Type        | Trade-off                                                        |
| ---------------------------------------------- | ----------- | ---------------------------------------------------------------- |
| [BorgBackup](/software/backup/borgbackup/)     | Open source | Older and battle-tested, but needs Borg installed on the far end |
| [Kopia](/software/backup/kopia/)               | Open source | Same idea with a desktop app and policies; younger project       |
| [Arq](/software/backup/arq/)                   | Paid        | A scheduler and a GUI, for people who do not want to write one   |
| [Time Machine](/software/backup/time-machine/) | Built in    | Effortless locally, useless for off-site or for Linux hosts      |
| [rclone](/software/backup/rclone/)             | Open source | Mirrors files rather than versioning them                        |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install restic
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Release binaries on GitHub](https://github.com/restic/restic/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://restic.net/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/restic" title="Homebrew formula" icon="cube" subtitle="Formula definition and versions" >}}
{{< card link="https://restic.readthedocs.io/" title="Documentation" icon="book-open" subtitle="Backends, policies, pruning" >}}
{{< card link="https://github.com/restic/restic" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
