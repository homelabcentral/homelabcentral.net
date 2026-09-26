---
title: "Source Code Pro Nerd Font"
weight: 8
description: "Adobe's Source Code Pro, patched with Nerd Font glyphs."
---

{{< lead >}}The font that made open-source corporate typefaces normal.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/font-sauce-code-pro-nerd-font" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/ryanoasis/nerd-fonts/releases" >}}

## What it does

Adobe released Source Code Pro in 2012 under the Open Font License, at a time when a good monospace was something you bought. It is drawn on the skeleton of Source Sans Pro, narrowed for the monospace grid, with the disambiguation work done properly — a slashed zero, a distinct `1`/`l`/`I`, and punctuation sized to be visible at 11pt rather than merely present.

Seven weights with matching italics, and a variable-font build.

Nerd Fonts patches it as **SauceCodePro**, which is why the cask token does not say Source. Same glyphs, renamed to avoid the reserved font name in the licence.

## Ligatures and OpenType features

No programming ligatures. Adobe published a separate experiment, **Source Code Variable**, but ligatures were never part of the family.

The one feature worth knowing is `zero` — the slashed zero is available as an alternate rather than being the default in every build. The syntax for enabling it, per editor and per terminal, is on the [Fonts](/software/fonts/) page.

## Notes

- The patched family is `SauceCodePro Nerd Font`, and the terminal variant `SauceCodePro Nerd Font Mono`.
- It pairs with Source Sans and Source Serif at matching weights, the same way [IBM Plex Mono](/software/fonts/font-blex-mono-nerd-font/) pairs with the rest of Plex.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [IBM Plex Mono](/software/fonts/font-blex-mono-nerd-font/) | Open source | Warmer letterforms, the same no-ligature stance |
| [JetBrains Mono](/software/fonts/font-jetbrains-mono-nerd-font/) | Open source | Taller x-height, ligatures on by default |
| [Meslo LG](/software/fonts/font-meslo-lg-nerd-font/) | Open source | Wider and plainer, with three line-gap options |
| [Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono) | Open source | Google's equivalent, tighter and less distinctive |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-sauce-code-pro-nerd-font
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Nerd Fonts releases](https://github.com/ryanoasis/nerd-fonts/releases) — the archive is named `SourceCodePro`

{{< /tab >}}
{{< tab name="Unpatched" >}}

The original, without icon glyphs:

```shell
brew install --cask font-source-code-pro
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://adobe-fonts.github.io/source-code-pro/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/font-sauce-code-pro-nerd-font" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/adobe-fonts/source-code-pro" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
