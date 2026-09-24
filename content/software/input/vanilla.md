---
title: "Vanilla"
weight: 4
description: "Hide menu bar icons."
---

{{< lead >}}Splits the menu bar into always-visible and hidden halves, with a toggle between them.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/vanilla" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://matthewpalmer.net/vanilla/" >}}

## What it does

Vanilla adds a divider to the menu bar. Icons dragged to the far side are hidden until the divider is clicked, which keeps the bar down to the three or four items that actually need watching while leaving the rest reachable.

On a laptop with a notch this matters more than it sounds — the notch eats menu bar width, and enough menu bar items will start hiding *application* menus instead.

## Notes

Free with a paid Pro tier (auto-hide timers, more control). Alternatives with different trade-offs are Ice (open source, free) and Bartender (paid, more features). Any of them needs the icons to be draggable, which a few apps' items are not.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Ice](https://icemenubar.app/) | Open source | Now the usual recommendation |
| [Bartender](https://www.macbartender.com/) | Freemium | The most featureful, with search and triggers |
| [Hidden Bar](https://github.com/dwarvesf/hidden) and [Dozer](https://github.com/Mortennn/Dozer) | Open source | Minimal, like Vanilla itself |
| System Settings → Control Centre → Automatically hide the menu bar | Built in | Blunt, no third-party app |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask vanilla
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://matthewpalmer.net/vanilla/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://matthewpalmer.net/vanilla/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/vanilla" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
