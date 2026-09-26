---
title: "IBM Plex Mono Nerd Font"
weight: 6
description: "IBM Plex Mono, patched with Nerd Font glyphs."
---

{{< lead >}}IBM's corporate typeface, which turned out to be one of the best free monospaces ever released.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/font-blex-mono-nerd-font" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/ryanoasis/nerd-fonts/releases" >}}

## What it does

IBM Plex Mono is the monospaced member of the Plex superfamily, commissioned by IBM to replace Helvetica as its corporate face and released under the SIL Open Font License. It is warmer than the Swiss-grid fonts it competes with — the letterforms borrow from IBM's Selectric typewriter era, with a slight humanist slant to the terminals and a true italic rather than an oblique.

Nerd Fonts patches it as **BlexMono**, which is why the Homebrew token does not say Plex. The name is the only thing that changes; the glyphs are IBM's.

## Ligatures and OpenType features

Plex Mono has **no programming ligatures**. If `=>` rendering as two characters is what you want, this is the family that does it without a configuration flag.

What it does have is a matching sans and serif at the same metrics and optical weight, which makes it unusually good for a site or document where code and prose sit together — and seven weights, each with an italic.

The syntax for switching OpenType features on or off, per editor and per terminal, is on the [Fonts](/software/fonts/) page.

## Notes

- The patched variants follow the usual naming: `BlexMono Nerd Font`, `BlexMono Nerd Font Mono`, `BlexMono Nerd Font Propo`.
- IBM also publishes Plex Sans and Plex Serif, free, from the same project — useful if the terminal font and the site body font should look related.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [JetBrains Mono](/software/fonts/font-jetbrains-mono-nerd-font/) | Open source | A taller x-height and ligatures on by default |
| [Source Code Pro](/software/fonts/font-sauce-code-pro-nerd-font/) | Open source | The other corporate open-source monospace, also ligature-free |
| [Fira Code](/software/fonts/font-fira-code-nerd-font/) | Open source | The same shape of design decision taken the other way, on ligatures |
| [Google Sans Code](/software/fonts/font-google-sans-code/) | Open source | Newer, and designed around the same code-and-prose pairing idea |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-blex-mono-nerd-font
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Nerd Fonts releases](https://github.com/ryanoasis/nerd-fonts/releases) — the archive is named `IBMPlexMono`

{{< /tab >}}
{{< tab name="Unpatched" >}}

The original, without icon glyphs:

```shell
brew install --cask font-ibm-plex-mono
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.ibm.com/plex/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/font-blex-mono-nerd-font" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/IBM/plex" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
