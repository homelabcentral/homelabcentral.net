---
title: "ncdu"
weight: 2
description: "NCurses disk usage analyser."
---

{{< lead >}}Scans a directory tree and lets you browse it sorted by size, in a terminal.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/ncdu" >}}

## What it does

ncdu scans a path, then presents it as an interactive list sorted largest-first. Arrow keys navigate in and out, `d` deletes, and the totals update. It runs over SSH, which is what makes it the right tool for a full disk on a headless server.

```shell
ncdu /
ncdu -x /              # stay on one filesystem
ncdu -o scan.json /    # save a scan
ncdu -f scan.json      # browse it later
```

## Notes

`sudo` is needed to see other users' and system directories. `-x` is almost always wanted on macOS, otherwise it wanders into mounted volumes and network shares.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [dust](https://github.com/bootandy/dust) | Open source | A friendlier `du` with a bar chart, no interactive browsing |
| [gdu](https://github.com/dundee/gdu) | Open source | Considerably faster on SSDs, same interface idea |
| [dua-cli](https://github.com/Byron/dua-cli) | Open source | Parallel scanning with an interactive mode |
| `du -sh * \| sort -h` | Built in | No install, and enough surprisingly often |
{{< /borderless-table >}}

## Install

```shell
brew install ncdu
```

## Links

{{< cards cols="2" >}}
{{< card link="https://dev.yorhel.nl/ncdu" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/ncdu" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< /cards >}}
