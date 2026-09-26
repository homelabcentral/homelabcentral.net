---
title: "PeaZip"
weight: 2
description: "Open-source archive manager with strong encryption."
---

{{< lead >}}Handles 200-plus archive formats, creates encrypted archives, and doubles as a file manager.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://peazip.github.io/peazip-macos.html" >}}

## What it does

PeaZip is a full archive manager rather than just an extractor. It fully supports creating 7Z, ZIP, TAR, GZ, BZ2, XZ, ZST, BR, WIM, PAQ/ZPAQ and its own PEA format, and can browse and extract RAR, CAB, DEB, DMG, ISO, LHA, UDF and ZIPX among 200-plus types.

Beyond compression it covers:

- **Authenticated encryption** with AES-256, Twofish and Serpent, in PEA, ZIP, 7Z, ARC and RAR containers,
- **Two-factor archive protection** — password plus keyfile, which is unusual in a free archiver,
- an encrypted password manager,
- self-extracting archives, volume spanning and split files,
- secure deletion, duplicate finding and hash calculation,
- exporting any operation as a command-line script.

## Notes

- Not in Homebrew; download from the project site.
- It is a Free Pascal / Lazarus application, so the interface is not native-looking on macOS.
- The PEA format is PeaZip's own. Anything meant to be opened elsewhere should be 7Z or ZIP with AES.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Keka](https://www.keka.io/) | Open source | A far more native macOS app for the same create-and-extract job |
| [BetterZip](https://macitbetter.com/) | Paid | Polished, with archive browsing |
| [7-Zip](/software/files/p7zip/) on the command line | Open source | The same compression and AES-256 without a GUI |
| [Cryptomator](https://cryptomator.org/) or [age](https://github.com/FiloSottile/age) | Open source | Better answers if encryption, not compression, is the point |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Direct download" selected=true >}}

[Download for macOS](https://peazip.github.io/peazip-macos.html)

{{< /tab >}}
{{< tab name="Source" >}}

```shell
git clone https://github.com/peazip/PeaZip
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://peazip.github.io/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/peazip/PeaZip" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
