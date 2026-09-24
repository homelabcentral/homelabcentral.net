---
title: "iTerm2"
weight: 1
description: "Terminal emulator with splits, search and profiles."
---

{{< lead >}}The terminal emulator most of the rest of this category runs inside.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/iterm2" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://iterm2.com/downloads.html" >}}

## What it does

iTerm2 replaces Apple's Terminal with the features a heavy terminal user eventually wants: split panes, a searchable scrollback, per-profile colour schemes and fonts, triggers that act on matched output, shell integration that marks command boundaries, and tmux control mode that renders tmux panes as native iTerm panes.

## Worth configuring first

- **Profiles → Keys → Presets → Natural Text Editing** — makes word-wise movement behave like every other macOS app.
- **Appearance → Panes** — dim inactive splits, which makes a four-pane layout readable.
- A Nerd Font (see the [Fonts](/software/fonts/) section) so Starship and `lsd` glyphs render.

## Notes

The app updates itself; Homebrew's version will lag.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Ghostty](https://ghostty.org/) | Open source | New, native, GPU-accelerated, and the current favourite of people leaving iTerm2 |
| [WezTerm](https://wezterm.org/) | Open source | Cross-platform, Lua-configured, excellent multiplexing built in |
| [Alacritty](https://alacritty.org/) and [kitty](https://sw.kovidgoyal.net/kitty/) | Open source | Minimal and fast; kitty has more features, Alacritty fewer |
| [Warp](https://www.warp.dev/) | Freemium | AI-first, account-gated, a very different model of what a terminal is |
| [Terminal.app](https://support.apple.com/guide/terminal/welcome/mac) | Built in | Genuinely fine for occasional use |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask iterm2
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://iterm2.com/downloads.html)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://iterm2.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/iterm2" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://iterm2.com/documentation.html" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
