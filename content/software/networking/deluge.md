---
title: "Deluge"
weight: 13
description: "Daemon-plus-client BitTorrent, extended by plugins."
---

{{< lead >}}A torrent daemon with a thin client attached, which is the right way round for a lab.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/deluge" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://dev.deluge-torrent.org/wiki/Download" >}}

## What it does

Deluge separates the parts: `deluged` does the transferring, and the GTK app, the web UI and `deluge-console` are three interfaces onto the same daemon. Start it on a server, connect from a laptop, close the laptop — the transfers never noticed.

Almost everything beyond the basics is a plugin: label-based organisation, scheduling, execute-on-complete, AutoAdd watch folders, and a large third-party set for cross-seeding and tracker handling.

## Notes

- **Thin client mode** is the point. Enable the daemon's remote connections and add a user in `auth`, then connect from anywhere — over [Tailscale](/software/networking/tailscale/) rather than a forwarded port.
- The Mac app is GTK rather than native, and looks it.
- Releases are infrequent. It is stable rather than abandoned, but do not expect a fast-moving project.
- BitTorrent is a distribution protocol, not a licence. Use it for Linux images, Creative Commons material and other content you have the right to share.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [qBittorrent](/software/networking/qbittorrent/) | Open source | A better web UI and search, one process rather than two |
| [Transmission](/software/networking/transmission/) | Open source | Native app, simpler daemon, fewer knobs |
| [rTorrent with ruTorrent](https://github.com/rakshasa/rtorrent) | Open source | The traditional seedbox pairing, configured in a file |
| µTorrent or BitTorrent Classic | Free | The clients this category left behind — ad-supported, and unmaintained on macOS |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask deluge
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://dev.deluge-torrent.org/wiki/Download)

{{< /tab >}}
{{< tab name="Docker" >}}

```shell
docker run -d --name deluge \
  -p 8112:8112 -p 6881:6881 -p 6881:6881/udp \
  -v ./config:/config -v ./downloads:/downloads \
  lscr.io/linuxserver/deluge:latest
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://deluge-torrent.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/deluge" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/deluge-torrent/deluge" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://deluge.readthedocs.io/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
