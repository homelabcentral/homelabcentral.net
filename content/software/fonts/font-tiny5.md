---
title: "Tiny5"
weight: 13
description: "A five-pixel-tall pixel face, one pixel per stroke."
---

{{< lead >}}Letterforms five pixels tall and one pixel wide, for readouts, HUDs and anywhere a label has to be small and still legible.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/font-tiny5" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://fonts.google.com/specimen/Tiny5" >}}

## What it does

Tiny5 reduces a glyph to a five-pixel grid with every stroke one pixel wide, which is about as little as a letter can be given and stay readable. It is proportionally spaced rather than monospaced, so this is a face for interface labels, instrument readouts and pixel-art titling — not a terminal font.

Pixels only stay pixels at the right size. The project's rule is to set it in multiples of 8px, equivalently 6pt increments, and anything in between lands strokes between device pixels and smears them.

Coverage is much wider than the pixel-font norm: Latin, Greek, Cyrillic and Armenian, so it survives contact with text it was not designed around.

Homebrew installs the static Regular that Google Fonts publishes. The upstream repository builds a variable version with weight, width, roundness, bleed and jitter axes — bleed imitating ink spread, jitter imitating a tired CRT — plus BDF builds for embedded renderers like `u8g2` and `TFT_eSPI`. If the variable axes are the reason you want it, take it from upstream rather than from the cask.

For headings and anything that needs to sit heavier next to this, the family's other member is [Tiny5 Duo](/software/fonts/font-tiny5-duo/).

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Tiny5 Duo](/software/fonts/font-tiny5-duo/) | Open source | The same letterforms with doubled stems, for emphasis |
| [Departure Mono](/software/fonts/font-departure-mono/) | Open source | Monospaced and much taller, so a terminal will take it |
| [Silkscreen](https://fonts.google.com/specimen/Silkscreen) | Open source | The long-standing default, Latin only |
| [Press Start 2P](https://fonts.google.com/specimen/Press+Start+2P) | Open source | Arcade styling, and wide enough to eat the line |
| [Pixelify Sans](https://fonts.google.com/specimen/Pixelify+Sans) | Open source | Chunkier pixels, a weight axis and nothing else |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-tiny5
```

{{< /tab >}}
{{< tab name="Google Fonts" >}}

[Download from the specimen page](https://fonts.google.com/specimen/Tiny5) — the same static Regular the cask installs.

{{< /tab >}}
{{< tab name="Upstream, variable" >}}

[Gissio/font_Tiny5](https://github.com/Gissio/font_Tiny5) commits its builds under `fonts/` — `otf/`, `ttf/`, `variable/`, `bdf/` and `webfonts/` — so the variable and BDF files are a download away. `make build` regenerates them from the sources.

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://fonts.google.com/specimen/Tiny5" title="Google Fonts specimen" icon="globe-alt" subtitle="Preview and download" >}}
{{< card link="https://formulae.brew.sh/cask/font-tiny5" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/Gissio/font_Tiny5" title="Gissio/font_Tiny5" icon="github" subtitle="Sources, variable and BDF builds, OFL" >}}
{{< /cards >}}
