---
title: "Maple Mono NF"
weight: 3
description: "Maple Mono, rounded, with Nerd Font glyphs."
---

{{< lead >}}A rounded open-source monospace with an unusually large ligature set and the finest-grained feature control of the group.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/font-maple-mono-nf" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/subframe7536/maple-font/releases" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://font.subf.dev/en/playground" >}}

## What it does

Maple Mono is a rounded monospaced family with smooth curves, a generous ligature set, and careful CJK support in its wider variants. The `NF` build is Nerd Font patched.

It reads softer than JetBrains Mono, which some people find less fatiguing over a long day and others find less precise. It is a preference, not a ranking.

## Ligatures and OpenType features

Maple exposes more of itself than most monospaced fonts: `cvXX` character variants, `ssXX` stylistic sets and `zero`, with the "normal" preset shipping `cv01, cv02, cv33, cv34, cv35, cv36, cv61, cv62, ss05, ss06, ss07, ss08` enabled.

Two things are specific to this family:

- **The variable build needs `calt` on** for any of the features to take effect. The upstream advice is to avoid the variable build unless you need it.
- **Features can be frozen into the font file** rather than configured per application. The build script's `--feat` flag bakes a choice in — `--feat zero,cv01,ss07,ss08` — and `--no-liga` produces a build with the ligatures removed outright. A browser-based **Custom Build** playground does the same without a local toolchain, which is the usual way people get exactly the font they want.

Freezing is the answer for anything that cannot express OpenType features — Xcode, most GUI diff tools, anything rendering to an image.

The syntax for switching any of these on or off, per editor and per terminal, is on the [Fonts](/software/fonts/) page.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Recursive Mono](https://www.recursive.design/) | Open source | Variable, with a similarly soft feel |
| [Comic Code](https://tosche.net/fonts/comic-code) | Paid | The other well-known rounded coding font |
| [Cascadia Code](https://github.com/microsoft/cascadia-code) | Open source | Rounder than JetBrains Mono without going as far |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-maple-mono-nf
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/subframe7536/maple-font/releases)

{{< /tab >}}
{{< tab name="Custom build" >}}

Pick features in the browser and download a font built to match: [the Custom Build playground](https://font.subf.dev/en/playground)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://font.subf.dev/en/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/font-maple-mono-nf" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/subframe7536/maple-font#features" title="Feature reference" icon="adjustments" subtitle="Every cvXX and ssXX, with samples" >}}
{{< card link="https://github.com/subframe7536/maple-font" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
