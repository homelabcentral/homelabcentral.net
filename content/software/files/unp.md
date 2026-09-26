---
title: "unp"
weight: 5
description: "Unpack anything with one command."
---

{{< lead >}}A wrapper that works out which extractor an archive needs and calls it.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/unp" >}}

## What it does

`unp` looks at a file, picks the right tool — `tar`, `unzip`, `7z`, `unrar`, `gunzip`, `bunzip2`, `xz`, `cabextract` and so on — and runs it with sensible flags. One command instead of remembering which of `tar xzf`, `tar xjf` or `tar xJf` this particular tarball wants.

```shell
unp archive.tar.zst
unp *.zip                # several at once
unp -U messy.zip         # unpack into a subdirectory
```

## Notes

A Perl script from Debian, so it depends on the extractors actually being installed — it dispatches, it does not decompress. With `p7zip` and `rar` present it covers essentially everything.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [dtrx](https://github.com/dtrx-py/dtrx) | Open source | The same idea, with safer extraction into a subdirectory by default |
| [atool](https://www.nongnu.org/atool/) | Open source | Another dispatcher, with more format coverage |
| `tar xf` | Built in | Modern tar detects compression on its own, which covers most cases |
{{< /borderless-table >}}

## Install

```shell
brew install unp
```

## Links

{{< cards cols="2" >}}
{{< card link="https://tracker.debian.org/pkg/unp" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/unp" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< /cards >}}
