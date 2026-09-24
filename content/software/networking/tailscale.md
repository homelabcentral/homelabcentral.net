---
title: "Tailscale"
weight: 1
description: "WireGuard mesh VPN for reaching your own machines."
---

{{< lead >}}Puts every device on a private network that works from anywhere, without port forwarding.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/tailscale-app" >}} {{< badge content="Mac App Store" color="purple" icon="shopping-bag" link="https://apps.apple.com/us/app/tailscale/id1475387142" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://tailscale.com/download/mac" >}}

## What it does

Tailscale builds a mesh VPN on WireGuard. Each device gets a stable `100.x.y.z` address inside your tailnet and connects directly to the others, punching through NAT where possible and relaying when not. Identity comes from an SSO login rather than shared keys, and access between devices is controlled by an ACL policy file.

For a homelab it removes the entire class of problem that is exposing services to the internet:

- no port forwarding, no dynamic DNS, no reverse proxy needed just for remote access,
- **MagicDNS** gives devices real names,
- a **subnet router** exposes a whole LAN segment to the tailnet,
- an **exit node** routes all your traffic through a chosen device,
- **Tailscale SSH** handles authentication and key management for you.

## Notes

- The free tier covers personal use generously.
- Headscale is a self-hosted, open-source control-plane implementation if depending on Tailscale's coordination server is unacceptable.
- The cask token is `tailscale-app`; the older `tailscale` formula is the CLI-only build.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Headscale](https://headscale.net/) | Open source | An open-source, self-hosted implementation of Tailscale's control plane |
| [NetBird](https://netbird.io/) and [ZeroTier](https://www.zerotier.com/) | Open source / Freemium | The closest direct competitors, both self-hostable |
| [Nebula](https://github.com/slackhq/nebula) | Open source | Slack's mesh VPN; more work to run, no coordination service to trust |
| Plain [WireGuard](https://www.wireguard.com/) | Open source | No NAT traversal, no key distribution, but nothing else to trust either |
| [Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/) | Freemium | For exposing a service rather than joining a network |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask tailscale-app
```

{{< /tab >}}
{{< tab name="Mac App Store" >}}

There is also a sandboxed App Store build: [Tailscale on the Mac App Store](https://apps.apple.com/us/app/tailscale/id1475387142)

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://tailscale.com/download/mac)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://tailscale.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/tailscale-app" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://tailscale.com/kb/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< card link="https://github.com/tailscale/tailscale" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
