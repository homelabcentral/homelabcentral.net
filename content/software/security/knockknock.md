---
title: "KnockKnock"
weight: 3
description: "Show everything persistently installed on the Mac."
---

{{< lead >}}Enumerates every mechanism something can use to start itself, and checks each against VirusTotal.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/knockknock" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://objective-see.org/products/knockknock.html" >}}

## What it does

Malware on macOS has to persist somehow, and there are a limited number of places to do it. KnockKnock, from Objective-See, enumerates them all: launch agents and daemons, login items, kernel and system extensions, browser extensions, cron jobs, dylib insertions, authorization plugins, Spotlight importers, QuickLook plugins and more.

Each item is shown with its signing status and can be checked against VirusTotal, so the output separates "signed by Apple", "signed by a developer you installed" and "unsigned binary in a temp directory".

## Notes

- Free and open source. Objective-See's other tools — BlockBlock, LuLu, Oversight — cover the monitoring side of the same question.
- It reports, it does not remove. Removal is a separate, deliberate step.
- Expect a long list on a machine with this much installed. Most of it is legitimate; the value is that anything unexpected stands out.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [BlockBlock](https://objective-see.org/products/blockblock.html) | Open source | The same developer's real-time version: it alerts as something installs persistence |
| [LuLu](https://objective-see.org/products/lulu.html) | Open source | Also Objective-See, an outbound firewall rather than a persistence auditor |
| `launchctl list` and `launchctl print-disabled` | Built in | Part of the same picture, built in |
| [Malwarebytes](https://www.malwarebytes.com/mac) or CleanMyMac's malware module | Freemium / Paid | Signature-based scanning rather than enumeration |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask knockknock
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://objective-see.org/products/knockknock.html)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://objective-see.org/products/knockknock.html" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/knockknock" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/objective-see/KnockKnock" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
