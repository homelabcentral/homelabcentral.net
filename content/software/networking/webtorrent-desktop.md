---
title: "WebTorrent Desktop"
weight: 14
description: "Streaming torrent client that plays while it downloads."
---

{{< lead >}}Press play on a torrent and watch it, rather than waiting for it.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/webtorrent" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://webtorrent.io/desktop/" >}}

## What it does

WebTorrent Desktop fetches pieces in the order a player needs them instead of the order that seeds fastest, so a video starts within seconds. It plays inside the app, or casts to AirPlay, Chromecast or DLNA.

The project's other half is what makes the name: WebTorrent speaks WebRTC as well as TCP and uTP, so a browser can be a peer. That means it also connects to peers no conventional client can reach — and, on a plain torrent, to fewer of them.

## Notes

- Sequential fetching costs swarm efficiency. For anything you intend to keep, a normal client is faster and a better citizen.
- Electron, so it is large on disk for what it does.
- BitTorrent is a distribution protocol, not a licence. Use it for Linux images, Creative Commons material and other content you have the right to share.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [qBittorrent](/software/networking/qbittorrent/) | Open source | Has sequential download too, without the player |
| [Transmission](/software/networking/transmission/) | Open source | Lighter, native, no streaming |
| [IINA](/software/media/iina/) plus a finished download | Open source | Better playback, once the file exists |
| [Plex](/software/media/plex/) | Freemium | For a library you already have, streamed properly |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask webtorrent
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://webtorrent.io/desktop/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://webtorrent.io/desktop/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/webtorrent" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/webtorrent/webtorrent-desktop" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
