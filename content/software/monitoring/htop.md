---
title: "htop"
weight: 3
description: "Interactive process viewer."
---

{{< lead >}}The `top` replacement that is on every machine — still the fastest way to find and kill a process.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/htop" >}}

## What it does

htop lists processes with per-core meters, sortable columns, a tree view, incremental search, and signal sending from a menu rather than by typing a PID. Compared to btop it is plainer, starts instantly, and is available on essentially every Unix system in existence.

```shell
htop
htop -u $USER        # only your processes
htop -t             # start in tree mode
# F4 filter · F5 tree · F6 sort · F9 kill
```

## Notes

On macOS some columns are less useful than on Linux — the kernel exposes different accounting — and it cannot see other users' processes without `sudo`. Worth having even with btop installed: it is the lowest-common-denominator tool, present on almost any Unix box you will ever SSH into, and the muscle memory is universal.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [btop](/software/monitoring/btop/) | Open source | Much better looking, with graphs and mouse support |
| top | Built in | Always present, no install, unpleasant to read |
| [procs](https://github.com/dalance/procs) | Open source | A modern `ps` replacement rather than an interactive monitor |
{{< /borderless-table >}}

## Install

```shell
brew install htop
```

## Links

{{< cards cols="2" >}}
{{< card link="https://htop.dev/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/htop" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/htop-dev/htop" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
