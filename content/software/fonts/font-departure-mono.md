---
title: "Departure Mono"
weight: 12
description: "Monospaced pixel font with a lo-fi technical vibe."
---

{{< lead >}}A monospaced face drawn on a pixel grid rather than smoothed onto one, built from the look of early command lines and late-90s screen fonts.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/font-departure-mono" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://departuremono.com/" >}}

## What it does

Departure Mono is a bitmap design shipped as an OTF: the outlines are square pixels, so it renders as crisp blocks instead of the anti-aliased edges every other family here produces. One weight, one width, no italic — there is no family to choose from, which is part of the appeal.

Because the glyphs are pixels, size matters more than usual. Off-grid sizes put pixel edges between device pixels and the whole thing turns soft, so pick a size that lands on the grid and stay there rather than nudging it a point at a time.

No Nerd Font build exists, so a terminal running Starship or `lsd` needs [Symbols Nerd Font](/software/fonts/font-symbols-only-nerd-font/) as a fallback for the icon glyphs.

The OpenType features are `onum`, `frac` and the stylistic sets `ss01` and `ss02`. There is no `calt` and no `liga` — the ligature switches in the table on the [section page](/software/fonts/) do nothing here, because there are no ligatures to turn off.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Tiny5](/software/fonts/font-tiny5/) | Open source | Five pixels tall, so a display face rather than a terminal font |
| [Monocraft](https://github.com/IdreesInc/Monocraft) | Open source | Minecraft letterforms, and the associations that come with them |
| [Pixel Code](https://qwerasd205.github.io/PixelCode/) | Open source | Programming ligatures, which this has none of |
| [Terminus](https://terminus-font.sourceforge.net/) | Open source | Bitmap formats only, which GUI applications often refuse |
| [JetBrains Mono Nerd Font](/software/fonts/font-jetbrains-mono-nerd-font/) | Open source | Legible at any size, with none of the character |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-departure-mono
```

{{< /tab >}}
{{< tab name="Nix" >}}

```shell
nix profile install github:NixOS/nixpkgs#departure-mono
```

On NixOS, add `departure-mono` to `fonts.packages` instead.

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the project site](https://departuremono.com/), which also serves the specimen and the OpenType feature samples.

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://departuremono.com/" title="departuremono.com" icon="globe-alt" subtitle="Specimen, samples and download" >}}
{{< card link="https://formulae.brew.sh/cask/font-departure-mono" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/rektdeckard/departure-mono" title="rektdeckard/departure-mono" icon="github" subtitle="Source and releases, MIT licensed" >}}
{{< /cards >}}
