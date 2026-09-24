---
title: "JetBrains Maple Mono NF"
weight: 4
description: "A hybrid of JetBrains Mono and Maple Mono, Nerd Font patched."
---

{{< lead >}}JetBrains Mono's Latin letterforms with Maple Mono's rounder details and CJK coverage.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/font-jetbrains-maple-mono-nf" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases" >}}

## What it does

A community fusion typeface: JetBrains Mono as the base for Latin characters, with Maple Mono supplying rounded punctuation, ligatures and the CJK ranges JetBrains Mono does not cover. Patched with Nerd Font glyphs.

The use case is wanting JetBrains Mono's precision for code while still having consistent coverage for Chinese, Japanese or Korean text in the same terminal, without a fallback font kicking in at a different weight and width.

## Ligatures and OpenType features

Ligatures come from the Maple side and sit in `calt`, as usual. Because the build merges two upstreams, its `ssXX` and `cvXX` tags follow whichever font contributed the glyph — so a variant documented for Maple Mono may or may not be present here.

Check the fusion project's own release notes before depending on a specific tag, and verify a candidate setting against a real file rather than a sample string. `'calt' 0` behaves as expected in every build.

The syntax for switching any of these on or off, per editor and per terminal, is on the [Fonts](/software/fonts/) page.

## Notes

Being a fusion of two upstreams, it lags both when they update.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Sarasa Mono](https://github.com/be5invis/Sarasa-Gothic) | Open source | The best-known Latin-plus-CJK monospace, built on Iosevka and Source Han |
| [Noto Sans Mono CJK](https://fonts.google.com/noto) | Open source | Exhaustive coverage, less character |
| Any Nerd Font plus a CJK fallback | — | Works, but the weights and widths rarely match |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-jetbrains-maple-mono-nf
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/font-jetbrains-maple-mono-nf" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
