---
title: "Inkscape"
weight: 1
description: "Open-source vector graphics editor."
---

{{< lead >}}A full SVG editor — the free counterpart to Illustrator, and native to the web's vector format.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/inkscape" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://inkscape.org/release/" >}}

## What it does

Inkscape edits SVG directly: paths, boolean operations, node editing, gradients, clipping and masking, text on a path, and a live XML editor for the underlying document. It exports to PNG, PDF, EPS and optimised SVG.

For site work the useful parts are cleaning up an SVG someone else produced, tracing a bitmap into paths, and **Save As → Optimised SVG**, which strips editor metadata and cuts file size substantially before an icon goes into `assets/`.

## Notes

- It is a GTK application, so it looks like a Linux app on macOS. Functionality is unaffected.
- The command line is scriptable, which is handy in a build step:

```shell
inkscape --export-type=png --export-width=512 logo.svg
inkscape --export-plain-svg --export-filename=clean.svg messy.svg
```

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Adobe Illustrator](https://www.adobe.com/products/illustrator.html) | Subscription | The industry standard, subscription only |
| [Affinity Designer](https://affinity.serif.com/designer/) | Paid | A one-off purchase and a much more polished macOS app |
| [Figma](https://www.figma.com/) | Freemium | Collaborative and browser-based; better for UI, worse for print |
| [Boxy SVG](https://boxy-svg.com/) and [Linearity Curve](https://www.linearity.io/curve/) | Freemium | Lighter native SVG editors |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask inkscape
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://inkscape.org/release/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://inkscape.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/inkscape" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://inkscape.org/learn/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< card link="https://gitlab.com/inkscape/inkscape" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
