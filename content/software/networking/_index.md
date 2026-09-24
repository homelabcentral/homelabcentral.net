---
title: "Networking & Remote Access"
weight: 9
description: "VPNs, mesh networking, remote desktops, file transfer and cable diagnostics."
---

{{< lead >}}Getting into the lab from outside it, moving files around inside it, and finding out why that USB-C cable is slow.{{< /lead >}}

Two VPNs with different jobs: one to reach your own machines, one to change where the internet thinks you are. Mixing those up is the most common homelab networking mistake.

{{< cards cols="3" >}}
{{< card link="tailscale" title="Tailscale" icon="status-online" subtitle="WireGuard mesh VPN for reaching your own machines." >}}
{{< card link="windscribe" title="Windscribe" icon="shield-check" subtitle="Commercial VPN for privacy and region changes." >}}
{{< card link="localsend" title="LocalSend" icon="paper-airplane" subtitle="Open-source AirDrop alternative over the local network." >}}
{{< card link="windows-app" title="Windows App" icon="desktop-computer" subtitle="Microsoft's RDP client — remote Windows desktops and Cloud PCs." >}}
{{< card link="rsync" title="rsync" icon="refresh" subtitle="Fast incremental file transfer and synchronisation." >}}
{{< card link="qbittorrent" title="qBittorrent" icon="download" subtitle="Open-source BitTorrent client with a web UI." >}}
{{< card link="whatcable" title="WhatCable" icon="link" subtitle="Menu bar USB-C cable and port diagnostics." >}}
{{< /cards >}}
