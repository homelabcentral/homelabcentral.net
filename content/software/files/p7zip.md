---
title: "7-Zip (p7zip)"
weight: 3
description: "The 7z archiver on the command line."
---

{{< lead >}}Creates and extracts 7z, with the best general-purpose compression ratio available.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/p7zip" >}}

## What it does

`7z` implements the 7z format — LZMA/LZMA2 compression, solid archives, AES-256 encryption including encrypted headers — and reads most other formats too.

```shell
7z a archive.7z folder/              # create
7z a -mx=9 -mhe=on -p archive.7z f/  # max compression, encrypted headers, password
7z x archive.7z                      # extract preserving paths
7z l archive.7z                      # list contents
7z t archive.7z                      # test integrity
```

## Notes

`-mhe=on` encrypts the file list as well as the contents; without it an encrypted archive still reveals every filename inside. `-mx=9` is slow and memory-hungry, but the ratio difference on source code and text is substantial.

The `p7zip` formula is the POSIX port; Homebrew also carries `sevenzip`, the official upstream build.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [sevenzip](https://www.7-zip.org/) | Open source | The official upstream 7-Zip build, also in Homebrew, and better maintained |
| [Keka](https://www.keka.io/) | Open source | The same formats with a GUI |
| [zstd](https://github.com/facebook/zstd) | Open source | Much faster for everyday compression, if the recipient has it |
| tar plus xz | Built in | Universally available on Unix |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install p7zip
```

{{< /tab >}}
{{< tab name="Official build" >}}

```shell
brew install sevenzip
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/p7zip-project/p7zip" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/p7zip" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://7-zip.org/" title="Documentation" icon="book-open" subtitle="7-Zip upstream" >}}
{{< /cards >}}
