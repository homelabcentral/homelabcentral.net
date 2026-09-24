---
title: "Homebrew (BrewUI)"
weight: 10
description: "Homebrew's official GUI."
---

{{< lead >}}Homebrew's own graphical front end, for browsing and updating what the CLI installed.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/homebrew-app" >}}

## What it does

BrewUI is a native macOS app maintained by the Homebrew project. It lists installed formulae and casks, shows what is outdated, searches the catalogue, and runs installs, upgrades and uninstalls through the same `brew` underneath.

It is a convenience layer, not a separate package manager — anything it does is reproducible with `brew` in a terminal, and state is shared.

## Notes

Both the app and the CLI write to the same prefix, so mixing them is safe. The app does not manage taps as thoroughly as the CLI, so third-party taps still want `brew tap`.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Applite](https://aerolite.dev/applite/) | Open source | A friendlier front end aimed squarely at casks |
| [Cakebrew](https://www.cakebrew.com/) | Open source | The long-standing third-party Homebrew GUI |
| `brew` in a terminal | — | Everything the GUI does, scriptable |
{{< /borderless-table >}}

## Install

```shell
brew install --cask homebrew-app
```

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/Homebrew/BrewUI" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/homebrew-app" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/Homebrew/BrewUI" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://docs.brew.sh/" title="Documentation" icon="book-open" subtitle="Homebrew documentation" >}}
{{< /cards >}}
