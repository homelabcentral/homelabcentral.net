---
title: "Mist"
weight: 9
description: "Download macOS installers and firmwares."
---

{{< lead >}}Lists every macOS installer and IPSW Apple still publishes, and downloads any of them.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/mist" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/ninxsoft/Mist/releases" >}}

## What it does

Mist (**M**ac **I**nstaller **S**uper **T**ool) queries Apple's software catalogues and shows the full list of available macOS installers and Apple Silicon IPSW firmware files, including older versions and betas. It can download them as an application, a disk image, or a package.

That solves a real problem: the App Store only offers the current release, and reinstalling or testing against an older macOS otherwise means hunting for links.

```shell
brew install mist-cli     # the command-line version
mist list installer
mist download installer "14.7" application
```

## Notes

Pairs with **CrystalFetch** — one builds Windows media, the other macOS media. The result is what goes onto a USB stick with `createinstallmedia`, or gets attached to a UTM virtual machine.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [mist-cli](https://github.com/ninxsoft/mist-cli) | Open source | The same tool without the GUI, scriptable |
| `softwareupdate --fetch-full-installer` | Built in | Only offers recent releases |
| [ipsw.me](https://ipsw.me/) | Free | A long-standing index of IPSW firmware links |
| [The App Store](https://www.apple.com/app-store/) | Built in | Fine if the current release is the one you want |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask mist
```

{{< /tab >}}
{{< tab name="CLI" >}}

```shell
brew install mist-cli
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/ninxsoft/Mist/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/ninxsoft/Mist" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/mist" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/ninxsoft/Mist" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
