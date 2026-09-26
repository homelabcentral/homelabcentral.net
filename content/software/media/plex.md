---
title: "Plex"
weight: 18
description: "Media server and client for a home library."
---

{{< lead >}}Indexes a media library, fetches metadata, and streams it to anything with a screen.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/plex" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.plex.tv/media-server-downloads/?cat=plex+desktop" >}}

## What it does

Plex has two halves. **Plex Media Server** scans directories of films, TV, music and photos, matches them against online metadata sources for artwork and episode data, and serves them over the network — transcoding on the fly when a client cannot play the original. The desktop **app** is the client half.

For a homelab it is often the first service that justifies the hardware: a NAS full of files becomes something the rest of the household can actually use.

## Notes

- The cask installs the client. The server is a separate download (or a container) and is normally run on the box holding the storage, not a laptop.
- Transcoding is the expensive part. Direct play — where the client handles the original file — costs almost nothing, so library encoding choices matter more than server CPU.
- Jellyfin is the fully open-source alternative if the account requirement and paid Plex Pass features grate.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Jellyfin](https://jellyfin.org/) | Open source | Fully open source, no account, no paid tier; the usual alternative |
| [Emby](https://emby.media/) | Freemium | The project Jellyfin forked from, partly proprietary |
| [Infuse](https://firecore.com/infuse) | Freemium | A client rather than a server, and the best-looking one on Apple platforms |
| [Kodi](https://kodi.tv/) | Open source | Local-first, endlessly customisable, no server component required |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask plex
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.plex.tv/media-server-downloads/?cat=plex+desktop)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.plex.tv/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/plex" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://www.plex.tv/media-server-downloads/" title="Plex Media Server" icon="server" subtitle="The server half, downloaded separately" >}}
{{< card link="https://support.plex.tv/articles/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
