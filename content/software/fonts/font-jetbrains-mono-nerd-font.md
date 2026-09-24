---
title: "JetBrains Mono Nerd Font"
weight: 1
description: "JetBrains Mono, patched with Nerd Font glyphs."
---

{{< lead >}}A safe default coding font — tall x-height, clear glyph separation, programming ligatures.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/font-jetbrains-mono-nerd-font" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/ryanoasis/nerd-fonts/releases" >}}

## What it does

JetBrains Mono was designed for reading code: a taller x-height for legibility at small sizes, deliberately distinct `1lI` and `0O`, and ligatures for common operator sequences (`->`, `!=`, `>=`).

This cask is the **Nerd Font** patched build, which adds icon glyphs on top — file type icons in `lsd`, powerline separators and language symbols in Starship, box drawing in TUI tools.

## Ligatures and OpenType features

From version 2.304 the family ships stylistic sets and character variants alongside the ligatures:

{{< borderless-table >}}
| Feature | Effect |
| --- | --- |
| `calt` | Every ligature. On by default; `'calt' 0` removes all of them |
| `zero` | Slashed zero |
| `ss01`–`ss20` | Stylistic sets — each changes a group of characters |
| `cv01`–`cv99` | Character variants — each changes a single character |
{{< /borderless-table >}}

The combination worth knowing is alternates without ligatures, which the upstream documentation gives as `'calt' 0, 'zero', 'cv01', 'cv03', 'cv07', 'cv12'`. For editors with no OpenType control, **JetBrains Mono NL** is a separate build containing no ligatures at all.

The syntax for switching any of these on or off, per editor and per terminal, is on the [Fonts](/software/fonts/) page.

## Notes

- Set it in iTerm2 under **Profiles → Text**; a separate non-ASCII font is unnecessary because the patched build covers those ranges itself.
- Editors need the font set separately from the terminal — in VS Code, `editor.fontFamily`.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Fira Code](/software/fonts/font-fira-code-nerd-font/) | Open source | The font that popularised programming ligatures |
| [Cascadia Code](https://github.com/microsoft/cascadia-code) | Open source | Microsoft's, also ligature-heavy, with a cursive italic |
| [IBM Plex Mono](https://www.ibm.com/plex/) and [SF Mono](https://developer.apple.com/fonts/) | Open source / Built in | Clean, no ligatures, no patching needed |
| [Iosevka](https://typeof.net/Iosevka/) | Open source | Narrow, endlessly configurable, fits more columns on screen |
| [Berkeley Mono](https://usgraphics.com/products/berkeley-mono) and [MonoLisa](https://www.monolisa.dev/) | Paid | The two people actually pay for |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-jetbrains-mono-nerd-font
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Nerd Fonts releases](https://github.com/ryanoasis/nerd-fonts/releases)

{{< /tab >}}
{{< tab name="Unpatched" >}}

The original, without icon glyphs:

```shell
brew install --cask font-jetbrains-mono
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.jetbrains.com/lp/mono/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/font-jetbrains-mono-nerd-font" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/JetBrains/JetBrainsMono/wiki/OpenType-features" title="OpenType features" icon="adjustments" subtitle="Every ssXX and cvXX, with samples" >}}
{{< card link="https://github.com/JetBrains/JetBrainsMono" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
