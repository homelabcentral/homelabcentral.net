---
title: "Fonts"
weight: 17
description: "Monospaced coding fonts, mostly Nerd Font patched."
---

{{< lead >}}Ten monospaced families, and the glyph set that makes the unpatched ones usable in a terminal.{{< /lead >}}

Most of the list is a **Nerd Font** build: the original typeface plus several thousand glyphs from Font Awesome, Devicons, Octicons and Material. Starship, `lsd`, `superfile` and `btop` all draw those glyphs, and without them they render as empty boxes. Two families here have no patched build — pair those with [Symbols Nerd Font](/software/fonts/font-symbols-only-nerd-font/) as a fallback and the icons resolve anyway.

{{< cards cols="3" >}}
{{< card link="font-jetbrains-mono-nerd-font" title="JetBrains Mono Nerd Font" icon="code" subtitle="JetBrains Mono, patched with Nerd Font glyphs." >}}
{{< card link="font-fira-code-nerd-font" title="Fira Code Nerd Font" icon="code" subtitle="Fira Code, patched with Nerd Font glyphs." >}}
{{< card link="font-maple-mono-nf" title="Maple Mono NF" icon="code" subtitle="Maple Mono, rounded, with Nerd Font glyphs." >}}
{{< card link="font-jetbrains-maple-mono-nf" title="JetBrains Maple Mono NF" icon="code" subtitle="A hybrid of JetBrains Mono and Maple Mono, Nerd Font patched." >}}
{{< card link="font-space-mono-nerd-font" title="Space Mono Nerd Font" icon="code" subtitle="Space Mono, patched with Nerd Font glyphs." >}}
{{< card link="font-blex-mono-nerd-font" title="IBM Plex Mono Nerd Font" icon="code" subtitle="IBM Plex Mono, patched with Nerd Font glyphs." >}}
{{< card link="font-meslo-lg-nerd-font" title="Meslo LG Nerd Font" icon="code" subtitle="Menlo with adjustable line gap, Nerd Font patched." >}}
{{< card link="font-sauce-code-pro-nerd-font" title="Source Code Pro Nerd Font" icon="code" subtitle="Adobe's Source Code Pro, patched with Nerd Font glyphs." >}}
{{< card link="font-google-sans-code" title="Google Sans Code" icon="code" subtitle="Google's monospace, for code and prose together." >}}
{{< card link="font-monolisa" title="MonoLisa" icon="code" subtitle="Paid coding typeface, drawn rather than adapted." >}}
{{< card link="font-symbols-only-nerd-font" title="Symbols Nerd Font" icon="sparkles" subtitle="The icon glyphs alone, as a fallback for unpatched families." >}}
{{< /cards >}}

## Ligatures, or not

Half this list has programming ligatures and half deliberately does not, which is the first thing to decide.

{{< borderless-table >}}
| Ligatures | Families |
| --- | --- |
| Yes | JetBrains Mono, Fira Code, Maple Mono, JetBrains Maple Mono, MonoLisa |
| No | IBM Plex Mono, Meslo LG, Source Code Pro, Google Sans Code, Space Mono |
{{< /borderless-table >}}

A ligature draws `!=` as a single crossed-out equals sign. It reads well, and it also means the glyph on screen no longer corresponds one-to-one with the characters in the file — which is fine until you are counting columns, or reading a language where `<-` and `< -` differ. Both positions are defensible; the families in the second row simply never offer the choice.

## Where these come from

Nerd Fonts patches the upstream families and publishes the results; Homebrew repackages those same archives as casks. Either route gives identical files.

{{< cards cols="2" >}}
{{< card link="https://www.nerdfonts.com/font-downloads" title="Nerd Fonts downloads" icon="download" subtitle="Preview and download any patched family directly" >}}
{{< card link="https://github.com/ryanoasis/nerd-fonts" title="ryanoasis/nerd-fonts" icon="github" subtitle="The patcher, the glyph sets and the release archives" >}}
{{< /cards >}}

Every patched family is in `homebrew-cask` itself — the separate `homebrew/cask-fonts` tap was retired, so nothing needs tapping first:

```shell
brew search '/font-.*-nerd-font/'
brew install --cask font-fira-code-nerd-font
```

Each family is published in three variants, which differ in how wide the icons are rather than in the typeface:

{{< borderless-table >}}
| Variant | Icon width | Use it for |
| --- | --- | --- |
| `Nerd Font` | Variable — icons may be wider than one cell | Editors and anywhere proportional icon width is fine |
| `Nerd Font Mono` | Forced to a single cell | Terminals, where a double-width glyph breaks column alignment |
| `Nerd Font Propo` | Proportional | Proportional-width UI, not code |
{{< /borderless-table >}}

## Turning features on and off

Ligatures live in the `calt` (contextual alternates) feature. `ssXX` stylistic sets usually change a group of characters, `cvXX` character variants usually change one, and `zero` is the slashed zero. Patching for Nerd Fonts leaves all of them intact.

Two things are worth knowing before reaching for these. Individual ligatures cannot be switched off one at a time — you disable `calt` wholesale, or pick the `ssXX`/`cvXX` toggles that change the glyphs involved. And disabling `calt` does **not** disable the alternates: `'calt' 0, 'zero', 'cv01'` keeps a slashed zero and one character variant while dropping every ligature.

{{< borderless-table >}}
| Application | How |
| --- | --- |
| VS Code | `"editor.fontLigatures": "'calt' 0, 'zero', 'cv01'"` — a plain `true` or `false` also works |
| Zed | `"buffer_font_features": { "calt": false, "ss01": true }` |
| JetBrains IDEs | **Settings → Editor → Font → Enable ligatures** — all or nothing |
| Xcode | No OpenType control at all; install a no-ligature build instead |
| Ghostty | `font-feature = -calt` to disable, `font-feature = ss01` to enable |
| kitty | `font_family family="Fira Code" features="+zero -calt"` |
| WezTerm | `harfbuzz_features = { "calt=0", "clig=0", "liga=0" }` |
| iTerm2 | **Profiles → Text → Use ligatures** — all or nothing, and `calt` only |
| Alacritty | No ligature support |
{{< /borderless-table >}}

{{< callout type="info" >}}
Editors that offer no OpenType control need a font built without ligatures. JetBrains publishes **JetBrains Mono NL** for exactly this, and Nerd Fonts patches it as `JetBrainsMonoNL Nerd Font`.
{{< /callout >}}
