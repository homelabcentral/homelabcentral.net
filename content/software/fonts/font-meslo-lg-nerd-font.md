---
title: "Meslo LG Nerd Font"
weight: 7
description: "Menlo with adjustable line gap, patched with Nerd Font glyphs."
---

{{< lead >}}Apple's Menlo, forked to fix the one thing about it that annoyed people.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/font-meslo-lg-nerd-font" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/ryanoasis/nerd-fonts/releases" >}}

## What it does

Meslo is a fork of Apple's Menlo — itself a fork of Bitstream Vera Sans Mono, by way of DejaVu — made to offer a choice of line spacing. Menlo's line gap is generous, which reads well in a document and wastes vertical space in a terminal. Meslo ships three variants of the same letterforms:

{{< borderless-table >}}
| Variant | Line gap |
| --- | --- |
| `MesloLGS` | Small — the compact one, and the usual choice |
| `MesloLGM` | Medium — Menlo's original spacing |
| `MesloLGL` | Large — for wide, low-density displays |
{{< /borderless-table >}}

Everything else is Menlo: a plain, wide, extremely legible grotesque with unmistakable `0`, `O`, `1`, `l` and `I`.

## Ligatures and OpenType features

None. Meslo has no programming ligatures and no stylistic sets — it inherits the DejaVu lineage, which predates all of that. There is nothing to turn off.

## Notes

- **This is the font Powerlevel10k asks you to install.** Its configuration wizard recommends `MesloLGS NF` specifically, and the recommendation is baked into enough guides that the file name is more famous than the typeface.
- Anything driving [Starship](/software/terminal/starship/) or a powerline prompt will be happy with it for the same reason: the glyph coverage is complete and the metrics are predictable.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Menlo](https://developer.apple.com/fonts/) | Built in | Already on the Mac, with no icon glyphs and one line gap |
| [Source Code Pro](/software/fonts/font-sauce-code-pro-nerd-font/) | Open source | Narrower, more contemporary, also ligature-free |
| [JetBrains Mono](/software/fonts/font-jetbrains-mono-nerd-font/) | Open source | Taller, tighter, ligatures included |
| [DejaVu Sans Mono](https://dejavu-fonts.github.io/) | Open source | The common ancestor, and the Linux default |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-meslo-lg-nerd-font
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Nerd Fonts releases](https://github.com/ryanoasis/nerd-fonts/releases) — the archive is named `Meslo`

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/andreberg/Meslo-Font" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/font-meslo-lg-nerd-font" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/andreberg/Meslo-Font" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k" title="Powerlevel10k notes" icon="terminal" subtitle="Why this font keeps being recommended" >}}
{{< /cards >}}
