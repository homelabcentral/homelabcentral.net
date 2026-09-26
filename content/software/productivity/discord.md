---
title: "Discord"
weight: 4
description: "Voice, video and text chat."
---

{{< lead >}}Where most self-hosting and homelab project communities actually answer questions.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/discord" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://discord.com/download" >}}

## What it does

Discord is servers of topic channels with text, voice, video and screen sharing. Its relevance to a homelab is not social: a large share of open-source infrastructure projects — Home Assistant, Proxmox community spaces, Jellyfin, countless smaller tools — run their support in Discord rather than a forum or mailing list.

That makes it a documentation source, with the accompanying problem that answers are not indexed by search engines and are hard to find again.

## Notes

- The app self-updates, so Homebrew's version lags.
- Screen sharing needs **Screen Recording** permission.
- Nothing said in a Discord server is private from the server's operators or Discord itself. Do not paste credentials or configuration containing them, which is a very common accident in support channels.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Slack](https://slack.com/) | Freemium | The same shape for work; better threading, worse for large communities |
| [Matrix with Element](https://element.io/) | Freemium | Open protocol, self-hostable, no single operator |
| [Zulip](https://zulip.com/) | Freemium | Threaded by design, and much better for searchable support channels |
| [Revolt](https://revolt.chat/) | Freemium | An open-source Discord clone, small but functional |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask discord
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://discord.com/download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://discord.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/discord" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
