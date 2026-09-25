---
title: "ExpressVPN"
weight: 7
description: "Big-brand VPN with its own protocol and audited RAM-only servers."
---

{{< lead >}}The expensive one, sold on speed and on never writing anything to a disk.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/expressvpn" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.expressvpn.com/vpn-software/vpn-mac" >}}

## What it does

ExpressVPN runs in 105 countries on **Lightway**, a protocol it wrote and open-sourced, built on wolfSSL and designed to reconnect instantly when a laptop changes network. Every server runs **TrustedServer**: RAM only, reimaged from a known image on each boot, so there is no persistent disk to seize or subpoena.

The client is the least cluttered of the big three, and the split tunnelling and kill switch are reliable rather than clever.

## Notes

- British Virgin Islands jurisdiction. Acquired by Kape Technologies in 2021 — a company whose history includes adware, and which also owns CyberGhost, Private Internet Access and several of the "best VPN" review sites that rank its products. That conflict is worth knowing before weighing the reviews.
- Lightway has been independently audited, and the source is public.
- Consistently the most expensive of the mainstream options, with no free tier.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Mullvad](/software/networking/mullvad/) | Subscription | Cheaper, independent, and does not own its own reviewers |
| [Proton VPN](/software/networking/proton-vpn/) | Freemium | Audited, Swiss, free tier, open source clients |
| [NordVPN](/software/networking/nordvpn/) | Subscription | More servers, more features bundled in, similar pricing games |
| [Surfshark](/software/networking/surfshark/) | Subscription | Much cheaper, unlimited devices |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask expressvpn
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.expressvpn.com/vpn-software/vpn-mac)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.expressvpn.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/expressvpn" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/expressvpn/lightway-core" title="Lightway" icon="github" subtitle="The protocol, open source" >}}
{{< card link="https://www.expressvpn.com/support/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
