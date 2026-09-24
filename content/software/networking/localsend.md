---
title: "LocalSend"
weight: 3
description: "Open-source AirDrop alternative over the local network."
---

{{< lead >}}Sends files between any two devices on the same network, whatever operating systems they run.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/localsend" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://localsend.org/download" >}}

## What it does

LocalSend discovers peers on the local network over multicast and transfers files directly between them over HTTPS with a self-signed certificate, no account and no internet round trip. Clients exist for macOS, Windows, Linux, Android and iOS, which is the entire point — AirDrop stops at the edge of Apple's ecosystem.

## Notes

- Both devices need to be on the same subnet, and client isolation on guest Wi-Fi will block discovery.
- Transfers are encrypted in flight, and nothing touches a third-party server.
- Add it to the firewall's allowed incoming connections or discovery works one way only.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [AirDrop](https://support.apple.com/en-us/119857) | Built in | Faster, but Apple devices only |
| [PairDrop](https://pairdrop.net/) or [Snapdrop](https://snapdrop.net/) | Open source | The same idea in a browser tab, nothing to install |
| [Syncthing](https://syncthing.net/) | Open source | Continuous sync rather than one-off sends |
| [KDE Connect](https://kdeconnect.kde.org/) | Open source | Broader device integration, weaker on macOS |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask localsend
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://localsend.org/download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://localsend.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/localsend" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/localsend/localsend" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
