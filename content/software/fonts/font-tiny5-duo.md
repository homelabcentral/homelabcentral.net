---
title: "Tiny5 Duo"
weight: 14
description: "Tiny5 with doubled stems, as the heavy voice of the family."
---

{{< lead >}}The same five-pixel letterforms as Tiny5 with their vertical stems two pixels wide, which is what passes for bold at this size.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/font-tiny5-duo" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/Gissio/font_Tiny5" >}}

## What it does

Tiny5 Duo shares [Tiny5](/software/fonts/font-tiny5/)'s character set, metrics and axes and differs in one thing: vertical stems are doubled. At five pixels tall there is no room for a conventional bold, so weight has to come from the stem count, and this is that — a heading face to set against Tiny5's body copy, used for titles, labels and HUD elements.

The same sizing rule applies. Multiples of 8px, or 6pt steps, or the pixels stop being pixels.

Unlike its sibling, the cask installs the **variable** files — weight, width, roundness, bleed and jitter, with the italic as a second file — because that is what Google Fonts carries for it. There is no specimen page in the Google Fonts catalogue yet, so Homebrew or the upstream repository are the two ways in.

Both members are proportionally spaced, which rules out a terminal; [Departure Mono](/software/fonts/font-departure-mono/) is the pixel face for that.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Tiny5](/software/fonts/font-tiny5/) | Open source | One-pixel stems, for body copy rather than headings |
| A `wght` axis on a conventional pixel font | — | Fewer files, and mush at five pixels tall |
| [Press Start 2P](https://fonts.google.com/specimen/Press+Start+2P) | Open source | Heavy by default, with no light companion to pair it with |
| [Pixelify Sans](https://fonts.google.com/specimen/Pixelify+Sans) | Open source | A real weight axis, at twice the height |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-tiny5-duo
```

{{< /tab >}}
{{< tab name="Upstream" >}}

[Gissio/font_Tiny5](https://github.com/Gissio/font_Tiny5) holds both members of the family, built, under `fonts/` — `otf/`, `ttf/`, `variable/`, `bdf/` and `webfonts/`.

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/Gissio/font_Tiny5" title="Gissio/font_Tiny5" icon="github" subtitle="Sources and builds for both members, OFL" >}}
{{< card link="https://formulae.brew.sh/cask/font-tiny5-duo" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
