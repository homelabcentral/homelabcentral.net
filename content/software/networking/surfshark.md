---
title: "Surfshark"
weight: 6
description: "Cheap VPN with unlimited simultaneous devices."
---

{{< lead >}}One subscription, every device in the house, no seat counting.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/surfshark" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://surfshark.com/download/macos" >}}

## What it does

Surfshark is a conventional WireGuard and OpenVPN provider with the usual kill switch, split tunnelling and ad-blocking DNS. Two things set it apart: **unlimited simultaneous connections**, which no other major provider offers, and RAM-only servers with a no-logs policy that has been audited.

It also does MultiHop (two servers in sequence), rotating IP, and a camouflage mode for networks that block VPN protocols by signature.

## Notes

- Netherlands jurisdiction. Merged with Nord Security in 2022, so it and [NordVPN](/software/networking/nordvpn/) share an owner while running separate infrastructure.
- Unlimited devices is the reason to pick it: a household, a lab full of VMs and a router all on one plan.
- Like the rest of the category, the price is a two-year deal and the renewal is not.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [NordVPN](/software/networking/nordvpn/) | Subscription | Same owner, bigger network, device limit, higher price |
| [Proton VPN](/software/networking/proton-vpn/) | Freemium | Open source clients and a free tier, ten devices |
| [Mullvad](/software/networking/mullvad/) | Subscription | Five devices, and a privacy model nothing else matches |
| [Windscribe](/software/networking/windscribe/) | Freemium | Unlimited devices on the paid plan too, and finer control |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask surfshark
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://surfshark.com/download/macos)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://surfshark.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/surfshark" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://support.surfshark.com/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
