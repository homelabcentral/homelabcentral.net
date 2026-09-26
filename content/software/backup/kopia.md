---
title: "Kopia"
weight: 7
description: "Snapshots with a desktop app and a policy engine."
---

{{< lead >}}Deduplicating encrypted snapshots with retention policies, a CLI and a GUI that share one repository format.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/kopia" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/kopia/kopia/releases" >}}

## What it does

Kopia snapshots directories into a repository on object storage, SFTP, WebDAV, a local disk or Backblaze B2, with per-path retention policies, compression and client-side encryption. KopiaUI is the desktop front end over the same repositories, so a machine can be driven by whichever fits.

```shell
kopia repository create filesystem --path /Volumes/Backup/kopia
kopia policy set --global --keep-daily 30 --keep-monthly 12
kopia snapshot create ~/Documents
kopia snapshot list
```

## Notes

- Retention is declarative — a policy per path, inherited from a global default — rather than something you script around `forget`.
- The formula installs the CLI only. KopiaUI ships as a separate download from the releases page.

## Alternative to

{{< borderless-table >}}
| Alternative                                | Type        | Trade-off                                                     |
| ------------------------------------------ | ----------- | ------------------------------------------------------------- |
| [restic](/software/backup/restic/)         | Open source | More mature and more widely audited; no GUI, no policy engine |
| [BorgBackup](/software/backup/borgbackup/) | Open source | Longer track record, but cannot write to object storage       |
| [Arq](/software/backup/arq/)               | Paid        | Commercial support and a Mac-native interface                 |
| [Duplicati](https://www.duplicati.com/)    | Open source | Similar scope, web UI, slower and more fragile                |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install kopia
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/kopia/kopia/releases) — KopiaUI is the `.dmg`.

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://kopia.io/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/kopia" title="Homebrew formula" icon="cube" subtitle="Formula definition and versions" >}}
{{< card link="https://kopia.io/docs/" title="Documentation" icon="book-open" subtitle="Repositories, policies, maintenance" >}}
{{< card link="https://github.com/kopia/kopia" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
