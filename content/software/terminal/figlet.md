---
title: "FIGlet"
weight: 19
description: "Print text as ASCII-art banners."
---

{{< lead >}}Large ASCII letters, for script banners and terminal headers.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/figlet" >}}

## What it does

FIGlet renders a string in a chosen ASCII font ("FIGfont"). It has exactly one job and does it since 1991.

```shell
figlet "Homelab"
figlet -f slant -w 120 "Deploy"
showfigfonts            # preview every installed font
```

## Notes

Commonly used to print a banner at the top of a long-running script or an SSH login MOTD, and to make a terminal recording's sections visually obvious.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [toilet](https://caca.zoy.org/wiki/toilet) | Open source | The same idea with colour and filter support |
| [gum](https://github.com/charmbracelet/gum) | Open source | Charm's toolkit: styled boxes and headers, much more modern-looking |
| [boxes](https://boxes.thomasjensen.com/) | Open source | Draws frames around text rather than enlarging it |
{{< /borderless-table >}}

## Install

```shell
brew install figlet
```

## Links

{{< cards cols="2" >}}
{{< card link="https://www.figlet.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/figlet" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< /cards >}}
