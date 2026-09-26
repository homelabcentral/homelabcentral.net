---
title: "Fira Code Nerd Font"
weight: 2
description: "Fira Code, patched with Nerd Font glyphs."
---

{{< lead >}}The font that popularised programming ligatures, and still the most configurable of them.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/font-fira-code-nerd-font" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/ryanoasis/nerd-fonts/releases" >}}

## What it does

Fira Code is Mozilla's Fira Mono with a large ligature set added: arrows, comparison operators, arithmetic, comment markers and the multi-character sequences that read badly as separate glyphs (`=>`, `<=`, `!==`, `|>`, `::`).

Where it goes further than most is control. Nearly every opinionated glyph has an alternate behind an OpenType tag, so the font can be tuned rather than accepted or rejected wholesale.

## Ligatures and OpenType features

{{< borderless-table >}}
| Feature | Effect |
| --- | --- |
| `calt` | Every ligature. On by default; `'calt' 0` removes all of them |
| `ss01`–`ss10` | Stylistic sets. `ss01` sans-serif `r`, `ss02` `<=`/`>=` with a horizontal bar, `ss03` traditional ampersand |
| `cv01`–`cv32` | Character variants. `cv01` single-storey `a` |
| `zero` | Slashed zero |
| `onum` | Oldstyle (lowercase) numerals |
{{< /borderless-table >}}

Several tags at once, in the form VS Code's own documentation uses:

```json
"editor.fontLigatures": "'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'zero', 'onum'"
```

The syntax for switching any of these on or off, per editor and per terminal, is on the [Fonts](/software/fonts/) page.

## Notes

- Individual ligatures have no tag of their own. Reach for the `ssXX` and `cvXX` toggles that affect the glyphs involved, or turn `calt` off entirely.
- The upstream project also publishes a no-ligature build for editors that cannot express any of this.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [JetBrains Mono](/software/fonts/font-jetbrains-mono-nerd-font/) | Open source | A taller x-height and a plainer design; the other default people land on |
| [Cascadia Code](https://github.com/microsoft/cascadia-code) | Open source | Microsoft's, a similar ligature set plus a cursive italic |
| [Iosevka](https://typeof.net/Iosevka/) | Open source | Narrower, and configurable at the source level rather than by feature tags |
| [Victor Mono](https://rubjo.github.io/victor-mono/) | Open source | Ligatures with an italic that goes fully cursive |
| [Monaspace](https://monaspace.githubnext.com/) | Open source | GitHub's superfamily, with ligature-like texture healing instead |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-fira-code-nerd-font
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Nerd Fonts releases](https://github.com/ryanoasis/nerd-fonts/releases)

{{< /tab >}}
{{< tab name="Unpatched" >}}

The original, without icon glyphs:

```shell
brew install --cask font-fira-code
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/tonsky/FiraCode" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/font-fira-code-nerd-font" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/tonsky/FiraCode/wiki/How-to-enable-stylistic-sets" title="Stylistic sets and variants" icon="adjustments" subtitle="The full list, and how to enable them per editor" >}}
{{< card link="https://github.com/tonsky/FiraCode" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
