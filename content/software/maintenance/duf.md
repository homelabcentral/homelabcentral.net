---
title: "duf"
weight: 3
description: "A better `df`."
---

{{< lead >}}Mounted filesystems and free space, in a readable table instead of a column of numbers.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/duf" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/muesli/duf/releases" >}}

## What it does

duf lists mounted devices grouped by type — local, network, special — with used and free space, percentages, bars and the filesystem type, colour-coded. It hides the dozens of synthetic macOS mounts that make plain `df` output unreadable.

```shell
duf
duf --only local
duf --sort size
duf --json        # for scripts
```

## Notes

On macOS the APFS container layout means several volumes share the same physical free space, and duf shows that honestly — the same figure repeated across volumes is correct, not a bug.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| `df -h` | Built in | All you need once you know which lines to ignore |
| [dysk](https://dystroy.org/dysk/) | Open source | A similar table-based `df` replacement |
| [Disk Utility](https://support.apple.com/guide/disk-utility/welcome/mac) | Built in | The graphical view of the same APFS container layout |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install duf
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Binaries on GitHub Releases](https://github.com/muesli/duf/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/muesli/duf" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/duf" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/muesli/duf" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
