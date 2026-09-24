---
title: "Google Drive"
weight: 8
description: "Google Drive desktop client with streamed files."
---

{{< lead >}}Mounts Drive as a volume and syncs selected folders, rather than downloading everything.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/google-drive" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.google.com/drive/download/" >}}

## What it does

Google Drive for desktop offers two modes per folder: **stream**, where files appear in a virtual volume and download on access, and **mirror**, where they exist locally and sync both ways. It also backs up chosen local folders to Drive, and syncs Google Photos.

## Notes

- Streaming uses a virtual filesystem, so the mount point is not an ordinary directory. Build tools, `find` and backup software behave oddly inside it — keep repositories and build outputs out.
- Mirror mode is what you want for anything a local tool needs to read reliably.
- Time Machine will not back up a streamed Drive; the cloud copy is the backup, which is a different guarantee.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [iCloud Drive](https://www.apple.com/icloud/) | Freemium | Already there, and better integrated with Finder |
| [Dropbox](https://www.dropbox.com/) | Freemium | The most reliable selective-sync implementation of the group |
| [OneDrive](https://www.microsoft.com/microsoft-365/onedrive/download) | Freemium | The right answer if the rest of the work is Microsoft 365 |
| [Syncthing](https://syncthing.net/) or [Nextcloud](https://nextcloud.com/) | Open source | Self-hosted, no third party holding the files |
| [rclone](https://rclone.org/) | Open source | Scriptable access to all of the above, without a sync daemon |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask google-drive
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.google.com/drive/download/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.google.com/drive/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/google-drive" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://support.google.com/drive/answer/10838124" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
