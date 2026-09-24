---
title: "lsd"
weight: 10
description: "`ls` with colours, icons and a tree mode."
---

{{< lead >}}A colourful `ls` with file-type icons and a built-in tree view.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/lsd" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/lsd-rs/lsd/releases" >}}

## What it does

lsd lists directories with per-type colours, Nerd Font icons, human-readable sizes, and a `--tree` mode that replaces most `tree` invocations. Git status per file is available with `--git`.

```shell
lsd -la
lsd --tree --depth 2
lsd -l --total-size
```

## Notes

The icons need a Nerd Font in the terminal; without one you get replacement boxes. Configuration is `~/.config/lsd/config.yaml`, which is where most people set `icons`, `sorting.dir-grouping` and a default long format.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [eza](https://eza.rocks/) | Open source | The actively maintained fork of `exa`, and the more common choice today |
| `ls -G` | Built in | Colours with one flag, no font requirements |
| [colorls](https://github.com/athityakumar/colorls) | Open source | A Ruby implementation of the same idea, slower |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install lsd
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Binaries on GitHub Releases](https://github.com/lsd-rs/lsd/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/lsd-rs/lsd" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/lsd" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/lsd-rs/lsd" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
