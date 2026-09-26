---
title: "Symbols Nerd Font"
weight: 11
description: "The Nerd Font glyphs alone, as a fallback for unpatched families."
---

{{< lead >}}Not a typeface — the icon half of every Nerd Font, packaged so any font can borrow it.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/font-symbols-only-nerd-font" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/ryanoasis/nerd-fonts/releases" >}}

## What it does

A Nerd Font build is the upstream typeface plus several thousand icon glyphs in the Private Use Area. Symbols Nerd Font is that second half on its own: the Font Awesome, Devicon, Octicon, Material, Weather and Powerline sets, with no Latin alphabet at all.

That makes it the answer for any font with no patched build — a paid family like [MonoLisa](/software/fonts/font-monolisa/), something new like [Google Sans Code](/software/fonts/font-google-sans-code/), or a face you drew yourself. Set it as the fallback, and the icons resolve to it while every ordinary character still comes from the font you chose.

## Setting it as the fallback

{{< borderless-table >}}
| Application | How |
| --- | --- |
| iTerm2 | **Profiles → Text → Use a different font for non-ASCII text**, then pick `Symbols Nerd Font Mono` |
| Ghostty | `font-family = MonoLisa` then `font-family = Symbols Nerd Font Mono` on the next line — later entries are fallbacks |
| kitty | `symbol_map U+E000-U+F8FF,U+F0000-U+FFFFD,U+100000-U+10FFFD Symbols Nerd Font Mono` |
| WezTerm | `font = wezterm.font_with_fallback { "MonoLisa", "Symbols Nerd Font Mono" }` |
| VS Code | `"editor.fontFamily": "MonoLisa, 'Symbols Nerd Font Mono', monospace"` |
| Alacritty | No fallback configuration — use a patched font instead |
{{< /borderless-table >}}

## Notes

- Install the **Mono** variant for terminals. The proportional one puts double-width icons in single cells and breaks column alignment, which is the same trap as with any other Nerd Font.
- The `symbol_map` ranges above are the Private Use blocks the glyphs actually live in. Mapping the whole of the PUA to this font is deliberate — nothing else should be drawing from there.
- A patched family is still simpler where one exists. This is for the cases where one does not.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| Any patched Nerd Font | Open source | One font, no fallback configuration, no choice of typeface |
| The [Nerd Fonts patcher](https://github.com/ryanoasis/nerd-fonts#font-patcher) | Open source | Patch a font yourself; fine privately, rarely licensed to share |
| [Powerline fonts](https://github.com/powerline/fonts) | Open source | Only the separators and branch glyphs, which most prompts outgrew |
| Turning the icons off in the tool | — | `lsd --icon never`, and a prompt preset without glyphs |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask font-symbols-only-nerd-font
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Nerd Fonts releases](https://github.com/ryanoasis/nerd-fonts/releases) — the archive is named `NerdFontsSymbolsOnly`

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.nerdfonts.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/font-symbols-only-nerd-font" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://www.nerdfonts.com/cheat-sheet" title="Cheat sheet" icon="search" subtitle="Every glyph and its code point" >}}
{{< card link="https://github.com/ryanoasis/nerd-fonts" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
