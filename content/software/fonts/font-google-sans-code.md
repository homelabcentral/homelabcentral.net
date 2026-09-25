---
title: "Google Sans Code"
weight: 9
description: "Google's monospace, drawn for code and prose together."
---

{{< lead >}}A 2025 monospace built to sit next to Google Sans without either looking borrowed.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/font-google-sans-code" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://fonts.google.com/specimen/Google+Sans+Code" >}}

## What it does

Google Sans Code is the monospaced companion to Google Sans, released in 2025 under the Open Font License. It is a variable font with a weight axis from Light to Bold and true italics, drawn with wider apertures and a larger x-height than the Roboto Mono it effectively replaces — which is the difference you notice in a documentation page rendered at 14px rather than in a terminal at 12pt.

Its design brief was code inside prose: the letterforms are close enough to the sans that a code span in a paragraph does not read as a different voice.

## Ligatures and OpenType features

No programming ligatures. There are stylistic alternates for a handful of characters, and the usual `zero` slashed-zero feature.

The syntax for switching any of these on or off, per editor and per terminal, is on the [Fonts](/software/fonts/) page.

## Notes

{{< callout type="warning" >}}
**This is not a Nerd Font.** There is no patched build, so a prompt drawing powerline separators or `lsd` icons will show empty boxes unless [Symbols Nerd Font](/software/fonts/font-symbols-only-nerd-font/) is installed and configured as the fallback. That is the supported route for any unpatched family.
{{< /callout >}}

- Being a variable font, weight is continuous — an editor that accepts a numeric weight can ask for 450 rather than choosing between Regular and Medium.
- Available from Google Fonts as a web font, which makes it a reasonable choice for a site whose code blocks should match its body text.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono) | Open source | Google's previous answer, tighter and more neutral |
| [IBM Plex Mono](/software/fonts/font-blex-mono-nerd-font/) | Open source | The same code-and-prose pairing idea, with a Nerd Font build |
| [JetBrains Mono](/software/fonts/font-jetbrains-mono-nerd-font/) | Open source | Built for editors rather than for documents, and patched |
| [Geist Mono](https://vercel.com/font) | Open source | Vercel's, from the same recent wave of corporate monospaces |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-google-sans-code
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Google Fonts](https://fonts.google.com/specimen/Google+Sans+Code)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://fonts.google.com/specimen/Google+Sans+Code" title="Homepage" icon="globe-alt" subtitle="Specimen and download" >}}
{{< card link="https://formulae.brew.sh/cask/font-google-sans-code" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/googlefonts/googlesans-code" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
