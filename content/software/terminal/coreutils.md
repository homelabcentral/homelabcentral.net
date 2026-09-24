---
title: "GNU coreutils"
weight: 13
description: "GNU versions of the standard Unix file, shell and text utilities."
---

{{< lead >}}The GNU `ls`, `cp`, `date`, `sed`-adjacent tools, because macOS ships the BSD ones.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/coreutils" >}}

## What it does

macOS inherits BSD userland, whose flags differ from GNU's in ways that break any script written on Linux — `date -d`, `sed -i` without an argument, `readlink -f`, `cp --reflink`, `stat -c`, `sort -V`.

Homebrew installs GNU coreutils with a `g` prefix: `gdate`, `gls`, `gcp`, `greadlink`, `gstat`. Nothing system-level is replaced.

## Putting them first

```shell
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
```

That shadows the BSD tools with unprefixed GNU names for your shell only.

{{< callout type="warning" >}}
Put the `gnubin` directory on `PATH` for interactive shells, not system-wide. macOS scripts and installers expect BSD behaviour and some of them break subtly when GNU tools answer instead.
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| The BSD tools already on macOS | Built in | Different flags, same jobs, nothing to install |
| [uutils-coreutils](https://uutils.github.io/) | Open source | A Rust reimplementation of GNU coreutils, drop-in in most cases |
| [busybox](https://busybox.net/) | Open source | One binary with small versions of everything, more common on embedded systems |
{{< /borderless-table >}}

## Install

```shell
brew install coreutils
```

## Links

{{< cards cols="2" >}}
{{< card link="https://www.gnu.org/software/coreutils/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/coreutils" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://www.gnu.org/software/coreutils/manual/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
