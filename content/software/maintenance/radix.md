---
title: "Radix"
weight: 1
description: "Native disk space analyser."
---

{{< lead >}}Scans a volume and shows what is using it, as a navigable treemap.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/radix" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://tryradix.app/" >}}

## What it does

Radix walks a volume and visualises usage so the largest consumers are immediately obvious, with drill-down into directories and deletion from within the app. It is the GUI answer to "the disk is full and Storage Settings says 60 GB of System Data".

## Notes

- Grant it **Full Disk Access** or it silently skips the directories most likely to hold the problem.
- APFS snapshots and local Time Machine backups frequently *are* the missing space, and no analyser can delete those — `tmutil listlocalsnapshots /` and `tmutil deletelocalsnapshots` handle them.
- `ncdu` does the same job in a terminal, including over SSH.
- Self-updating, so the Homebrew version lags.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [DaisyDisk](https://daisydiskapp.com/) | Paid | The paid classic, and still the nicest visualisation of the group |
| [GrandPerspective](https://grandperspectiv.sourceforge.net/) | Open source | A plain treemap |
| [OmniDiskSweeper](https://www.omnigroup.com/more) | Paid | List-based, unglamorous and fast |
| [ncdu](/software/maintenance/ncdu/) or [dust](https://github.com/bootandy/dust) | Open source | The same job in a terminal, and it works over SSH |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask radix
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://tryradix.app/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://tryradix.app/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/radix" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
