---
title: "SF Symbols"
weight: 8
description: "Apple's system icon library and browser app."
---

{{< lead >}}Apple's 6,000-plus icon set, with the app that lets you search, weight and export from it.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/sf-symbols" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://developer.apple.com/sf-symbols/" >}}

## What it does

SF Symbols is a library of vector symbols designed to sit alongside the San Francisco system font — they inherit weight, scale and optical alignment from surrounding text. The app browses the set, filters by category and availability, shows each symbol's name, and exports to SVG or copies the symbol name for use in code.

In SwiftUI a symbol is one line — `Image(systemName: "externaldrive.badge.wifi")` — which is why the app is mostly a search tool for names.

## Notes

- Symbols are versioned. A symbol introduced in SF Symbols 6 renders blank on an older OS, so check the availability badge before using one.
- Apple's licence permits use in app UI, not as general-purpose artwork or in logos.
- Apple ships beta builds through Developer Downloads ahead of the public release; the Homebrew cask tracks the public one.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Lucide](https://lucide.dev/), [Phosphor](https://phosphoricons.com/), [Heroicons](https://heroicons.com/) and [Tabler Icons](https://tabler.io/icons) | Open source / Free | Open-source sets for web and cross-platform work |
| [Font Awesome](https://fontawesome.com/) | Free | The largest set, with a paid tier |
| Nothing, inside Apple UI | — | Symbols align to the system font's metrics and weights in a way no other set does |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask sf-symbols
```

{{< /tab >}}
{{< tab name="Apple Developer" >}}

Public and beta builds: [developer.apple.com/sf-symbols](https://developer.apple.com/sf-symbols/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://developer.apple.com/sf-symbols/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/sf-symbols" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://developer.apple.com/design/human-interface-guidelines/sf-symbols" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
