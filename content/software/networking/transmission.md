---
title: "Transmission"
weight: 12
description: "Lightweight native BitTorrent client."
---

{{< lead >}}The Mac-native torrent client that gets out of the way.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/transmission" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://transmissionbt.com/download" >}}

## What it does

Transmission is a small, native Cocoa app over a C core. It downloads torrents, and the window shows the queue and little else. Encryption, peer exchange, DHT, local peer discovery and a scheduler are there; the endless preference tabs are not.

The same core also ships as `transmission-daemon` with a web interface and an RPC API, which is what runs on a NAS or a headless box — and what every mobile remote and `*arr` stack speaks to.

## Notes

- `brew install transmission-cli` gives `transmission-remote` and `transmission-create` without the app.
- Bind the daemon to a VPN interface, or run it in a container whose only route is the tunnel. A dropped VPN otherwise falls back to the normal uplink silently.
- In 2016 the official macOS download was served with malware twice after the project's site was compromised. Verify the checksum, or install through Homebrew.
- BitTorrent is a distribution protocol, not a licence. Use it for Linux images, Creative Commons material and other content you have the right to share.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [qBittorrent](/software/networking/qbittorrent/) | Open source | Far more settings, a search tab, and RSS rules |
| [Deluge](/software/networking/deluge/) | Open source | Plugin-driven, and built around a daemon from the start |
| [WebTorrent Desktop](/software/networking/webtorrent-desktop/) | Open source | For streaming a torrent rather than keeping it |
| µTorrent or BitTorrent Classic | Free | The clients this category left behind — ad-supported, and unmaintained on macOS |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask transmission
brew install transmission-cli    # remote control and torrent creation
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://transmissionbt.com/download)

{{< /tab >}}
{{< tab name="Docker" >}}

```shell
docker run -d --name transmission \
  -p 9091:9091 -p 51413:51413 -p 51413:51413/udp \
  -v ./config:/config -v ./downloads:/downloads \
  lscr.io/linuxserver/transmission:latest
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://transmissionbt.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/transmission" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/transmission/transmission" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/transmission/transmission/blob/main/docs/README.md" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
