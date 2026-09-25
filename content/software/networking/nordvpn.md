---
title: "NordVPN"
weight: 5
description: "The largest consumer VPN network, with a heavy client."
---

{{< lead >}}The one everybody has heard of, because it pays for everybody to have heard of it.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/nordvpn" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://nordvpn.com/download/mac/" >}}

## What it does

NordVPN runs several thousand servers across sixty-odd countries on its own NordLynx protocol, a WireGuard build with a double-NAT scheme that avoids storing a user's IP on the server. Around that: a kill switch, split tunnelling, Threat Protection for ad and malware filtering, Meshnet for linking your own devices, and obfuscated servers for networks that block VPNs.

Scale is the honest reason to pick it. If you need an exit in a specific small country, or a server that still works with a specific streaming service this month, the largest network wins by default.

## Notes

- Panama jurisdiction, no-logs policy audited more than once, and a 2018 server breach at a rented data centre that it disclosed late — worth knowing about before deciding what to trust it with.
- The client bundles a password manager, file encryption and a data-breach scanner. Opinions differ on whether that is value or bloat.
- Sold almost exclusively on multi-year deals, and the renewal price is several times the headline one.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Mullvad](/software/networking/mullvad/) | Subscription | A tenth of the servers, a far better privacy story, flat pricing |
| [Proton VPN](/software/networking/proton-vpn/) | Freemium | Audited, open source clients, and a free tier |
| [Surfshark](/software/networking/surfshark/) | Subscription | The same shape of product, cheaper, unlimited devices |
| [ExpressVPN](/software/networking/expressvpn/) | Subscription | The other big-brand option, with its own protocol |
| [Windscribe](/software/networking/windscribe/) | Freemium | Smaller, more configurable, run by far fewer people |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask nordvpn
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://nordvpn.com/download/mac/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://nordvpn.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/nordvpn" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://support.nordvpn.com/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
