---
title: "qBittorrent"
weight: 6
description: "Open-source BitTorrent client with a web UI."
---

{{< lead >}}An ad-free torrent client that can be driven entirely from a browser.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/qbittorrent" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.qbittorrent.org/download" >}}

## What it does

qBittorrent is a full-featured, open-source BitTorrent client: sequential download, per-torrent limits, IP filtering, RSS with auto-download rules, and a built-in search. The interesting part for a lab is the **Web UI** — it exposes the same client over HTTP with an API, so a headless instance on a server is managed from any browser.

## Notes

- Bind the client to a specific network interface (**Settings → Advanced**) if it should only ever transfer over a VPN; without that, a dropped tunnel silently falls back to the normal uplink.
- The Web UI should never be exposed directly to the internet — put it behind Tailscale or a reverse proxy with authentication.
- BitTorrent is a distribution protocol, not a licence. Use it for Linux images, Creative Commons material and other content you have the right to share.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Transmission](https://transmissionbt.com/) | Open source | Lighter and more Mac-native, fewer options |
| [Deluge](https://deluge-torrent.org/) | Open source | Daemon plus thin client, good for headless setups |
| [rTorrent with ruTorrent](https://github.com/rakshasa/rtorrent) | Open source | The traditional seedbox pairing |
| [WebTorrent Desktop](https://webtorrent.io/desktop/) | Open source | For streaming rather than collecting |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask qbittorrent
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.qbittorrent.org/download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.qbittorrent.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/qbittorrent" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/qbittorrent/qBittorrent" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/qbittorrent/qBittorrent/wiki" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
