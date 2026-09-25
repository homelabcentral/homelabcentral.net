---
title: "Proton VPN"
weight: 2
description: "Audited Swiss VPN with a genuinely usable free tier."
---

{{< lead >}}The one VPN that can be recommended to someone who will not pay for one.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/protonvpn" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://protonvpn.com/download" >}}

## What it does

Proton VPN tunnels traffic through Proton's servers over WireGuard, OpenVPN or its own Stealth protocol, which disguises the tunnel as ordinary TLS for networks that block VPNs outright. The client has a kill switch, per-app split tunnelling, and **Secure Core** — routing through a second server in Switzerland, Iceland or Sweden first, so the exit server never sees your real address.

The free tier is the unusual part: unlimited data, a handful of countries, no ads and no logging. Most free VPNs are an ad network wearing a tunnel; this one is subsidised by the paid tier.

## Notes

- Swiss jurisdiction, no-logs policy independently audited and the apps open source on every platform.
- NetShield blocks ads, trackers and malware domains at Proton's DNS, which also means Proton sees those queries.
- The free tier picks the server for you and excludes the streaming-friendly and P2P-friendly ones. That is the upsell, and it is an honest one.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Mullvad](/software/networking/mullvad/) | Subscription | No account and no free tier; the stronger privacy story |
| [Windscribe](/software/networking/windscribe/) | Freemium | A smaller free tier and much finer-grained controls |
| [NordVPN](/software/networking/nordvpn/) | Subscription | Bigger network, heavier client, aggressive marketing |
| [IVPN](https://www.ivpn.net/) | Subscription | Small, audited, transparent about ownership |
| Your own [WireGuard](https://www.wireguard.com/) server | Open source | Private by construction, but the exit IP is traceable to you |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask protonvpn
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://protonvpn.com/download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://protonvpn.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/protonvpn" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/ProtonVPN" title="Repository" icon="github" subtitle="Source code for every client" >}}
{{< card link="https://protonvpn.com/support/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
