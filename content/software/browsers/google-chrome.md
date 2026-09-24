---
title: "Google Chrome"
weight: 2
description: "Chrome, for compatibility and DevTools."
---

{{< lead >}}The reference Chromium build — what most of the web is actually tested against.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/google-chrome" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.google.com/chrome/" >}}

## What it does

Chrome is where DevTools features land first — the Lighthouse panel, performance traces, coverage, the network waterfall with throttling profiles. For front-end work it is the baseline, and for anything that has to work for the general public it is the browser most of that public is using.

It is also the profile that keeps Google service logins, which is why the Docs, Sheets and Slides shortcuts in `/Applications` are Chrome web apps.

## Notes

Chrome auto-updates itself through its own updater (`com.google.keystone`), so Homebrew's version lags and `brew upgrade` is largely ceremonial. Headless Chrome from this install is also what site crawlers and screenshot tools drive.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Chromium](https://www.chromium.org/) | Open source | The same engine without Google's proprietary additions |
| [Microsoft Edge](https://www.microsoft.com/edge) | Built in | Chromium with Microsoft's services and vertical tabs |
| [Brave](/software/browsers/brave-browser/) or [Vivaldi](https://vivaldi.com/) | Open source / Free | Chromium with privacy or customisation layered on |
| [Safari](https://www.apple.com/safari/) | Built in | Better battery life on a Mac, and the only engine iOS actually runs |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask google-chrome
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.google.com/chrome/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.google.com/chrome/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/google-chrome" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://developer.chrome.com/docs/devtools/" title="Documentation" icon="book-open" subtitle="DevTools documentation" >}}
{{< /cards >}}
