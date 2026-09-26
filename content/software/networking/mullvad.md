---
title: "Mullvad"
weight: 3
description: "Account-number VPN with no email address and a flat price."
---

{{< lead >}}€5 a month, no account, no email, and cash in an envelope accepted.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/mullvad-vpn" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://mullvad.net/download" >}}

## What it does

Mullvad is a WireGuard and OpenVPN provider whose distinguishing feature is what it refuses to collect. Signing up produces a 16-digit account number and nothing else — no email, no username, no password. Payment can be a card, crypto, or physical cash posted to them with that number written on it.

The client is open source, has a kill switch on by default, DNS and ad blocking, multihop, and **DAITA**, which pads and paces WireGuard packets so traffic analysis cannot fingerprint a site from packet timing alone.

## Notes

- Flat price for every plan. No tiers, no annual discount, no five-year deal, no affiliate programme — which is why it does not appear in "best VPN" listicles.
- All servers run from RAM with no disks, and the no-logs claim has survived an actual police search, which is rarer evidence than an audit.
- No free tier at all, and no port forwarding since 2023, which matters if you seed.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Proton VPN](/software/networking/proton-vpn/) | Freemium | Audited, Swiss, and free if you can live with three countries |
| [IVPN](https://www.ivpn.net/) | Subscription | The same anonymous-account model, a smaller network |
| [Windscribe](/software/networking/windscribe/) | Freemium | More configurable, a free tier, a less austere privacy story |
| [NordVPN](/software/networking/nordvpn/) | Subscription | Far more servers and far more marketing |
| [Tor](https://www.torproject.org/) | Open source | Actual anonymity rather than a trusted provider, at a speed cost |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask mullvad-vpn
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://mullvad.net/download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://mullvad.net/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/mullvad-vpn" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/mullvad/mullvadvpn-app" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://mullvad.net/help" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
