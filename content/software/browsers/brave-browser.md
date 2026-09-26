---
title: "Brave"
weight: 1
description: "Chromium-based browser with blocking built in."
---

{{< lead >}}Chromium with ad and tracker blocking in the browser rather than an extension.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/brave-browser" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://brave.com/download/" >}}

## What it does

Brave is Chromium with Brave Shields: ad blocking, tracker blocking, fingerprinting defences, HTTPS upgrading and cookie-consent dismissal, all native and enabled per site from the address bar. Because it is Chromium, every Chrome extension and all of DevTools work unchanged.

Other pieces are optional and off unless you turn them on — Brave Search, a private window using Tor, the crypto wallet and the rewards programme.

## Notes

Shields breaking a site is a real occurrence; the per-site toggle is the fix, and it is worth checking before debugging a page you are building. For that reason site testing should always be confirmed in a browser with no blocker.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Chrome](/software/browsers/google-chrome/) with [uBlock Origin Lite](/software/browsers/ublock-origin-lite/) | Free / Open source | The same result, assembled by hand |
| [Vivaldi](https://vivaldi.com/) | Free | Chromium with far more interface customisation and built-in blocking |
| [Orion](https://kagi.com/orion/) | Free | WebKit-based, extension-compatible, no Chromium |
| [Arc](https://arc.net/) and [Dia](https://www.diabrowser.com/) | Free | Chromium with a reimagined interface |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask brave-browser
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://brave.com/download/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://brave.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/brave-browser" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/brave/brave-browser" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
