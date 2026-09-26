---
title: "MonoLisa"
weight: 10
description: "Paid coding typeface, drawn rather than adapted."
---

{{< lead >}}The one in this list you have to buy, and the only one designed as a coding font from the first sketch.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.monolisa.dev/buy" >}}

## What it does

MonoLisa was drawn by type designers specifically for code, rather than adapted from a text face. The consequences are visible at small sizes: wider apertures so `c`, `e` and `s` do not close up, less repetition between similar shapes, and a slightly proportional feel achieved within the monospace grid by adjusting the drawing rather than the widths.

It ships in nine weights with true italics, a large ligature set that can be bought or omitted, and a variable build. Character variants cover the usual arguments — a single or double-storey `a` and `g`, a slashed, dotted or plain zero, straight or curly `l`.

## Ligatures and OpenType features

Ligatures sit in `calt` as usual, and the family is unusually generous with `ssXX` and `cvXX` alternates — most of the opinionated glyphs have two or three forms, selectable per editor.

The buying page lets you build the set: with or without ligatures, with or without the script and italic styles. The syntax for switching any of it on or off, per editor and per terminal, is on the [Fonts](/software/fonts/) page.

## Notes

{{< callout type="warning" >}}
**Not a Nerd Font, and it cannot legally be patched and redistributed.** Patching it for your own use is possible with the [Nerd Fonts patcher](https://github.com/ryanoasis/nerd-fonts#font-patcher); sharing the result is not. The supported route is installing [Symbols Nerd Font](/software/fonts/font-symbols-only-nerd-font/) and setting it as the fallback, which is exactly what it exists for.
{{< /callout >}}

- Licensed per person for personal use, with separate team and application-embedding licences. There is no free tier and no trial beyond the web previewer.
- No Homebrew cask, by definition — the files arrive from the purchase, and installing them is a drag into Font Book.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [JetBrains Mono](/software/fonts/font-jetbrains-mono-nerd-font/) | Open source | The free font MonoLisa is most often compared against |
| [Berkeley Mono](https://usgraphics.com/products/berkeley-mono) | Paid | The other paid favourite; sharper, more retro, similar price |
| [Dank Mono](https://philpl.gumroad.com/l/dank-mono) | Paid | Cheaper, with a cursive italic as its signature |
| [Operator Mono](https://www.typography.com/fonts/operator/styles) | Paid | The font that started the cursive-italic fashion, and the most expensive |
| [Fira Code](/software/fonts/font-fira-code-nerd-font/) | Open source | Free, with the most configurable ligature set of the open families |
{{< /borderless-table >}}

## Install

Buy and download from the developer, then open the `.otf` or `.ttf` files in Font Book:

[monolisa.dev/buy](https://www.monolisa.dev/buy)

```shell
# install for the current user from a downloaded folder
cp MonoLisa*/*.otf ~/Library/Fonts/
```

## Links

{{< cards cols="2" >}}
{{< card link="https://www.monolisa.dev/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://www.monolisa.dev/customizer" title="Customizer" icon="adjustments" subtitle="Preview the variants before buying" >}}
{{< card link="https://www.monolisa.dev/faq" title="Documentation" icon="book-open" subtitle="Licensing and installation" >}}
{{< /cards >}}
