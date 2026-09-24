---
title: "Windscribe"
weight: 2
description: "Commercial VPN for privacy and region changes."
---

{{< lead >}}A conventional VPN — encrypt the uplink, appear somewhere else.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/windscribe" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://windscribe.com/download" >}}

## What it does

Windscribe tunnels all traffic through one of its servers, which changes your apparent location and hides traffic from the local network and ISP. The client supports WireGuard, OpenVPN and IKEv2, split tunnelling per app or per destination, a firewall-based kill switch, and an ad/tracker blocker (R.O.B.E.R.T.) applied at their DNS.

## Different job to Tailscale

Tailscale connects you to your own machines. Windscribe changes where the public internet thinks you are. Running both is normal, but route conflicts are common — put the lab subnet in Windscribe's split-tunnel exclusions, or Tailscale traffic disappears into the tunnel.

## Notes

A VPN provider is a party you are choosing to trust with the traffic your ISP would otherwise see. That is a trade, not an upgrade — judge it on the provider's jurisdiction, audits and logging policy.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Mullvad](https://mullvad.net/) | Freemium | No account, cash accepted, the strongest privacy reputation of the group |
| [Proton VPN](https://protonvpn.com/) | Freemium | Audited, with a usable free tier |
| [IVPN](https://www.ivpn.net/) | Freemium | Small, audited, transparent about ownership |
| Your own [WireGuard](https://www.wireguard.com/) server | Open source | Private by construction, but the exit IP is traceable to you |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask windscribe
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://windscribe.com/download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://windscribe.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/windscribe" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://windscribe.com/support/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
