---
title: "MacPacker"
weight: 9
description: "Browse archives like folders, extract only what you need."
---

{{< lead >}}Opens an archive in a window you can walk through, nested archives included, and drags individual files straight out.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/macpacker" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://macpacker.app/" >}}

## What it does

MacPacker treats an archive as a folder. It lists the contents, previews a file without unpacking the rest, descends into an archive stored inside another archive, and lets a single file be dragged out to the Desktop — the operation macOS itself has never offered, where the alternative is extracting 400 MB to read one `README`.

It reads past the formats Finder knows: forty-odd archive, disk image and compression formats, which covers the RAR and 7z most of this section exists to handle.

The comparison it invites is 7-Zip's file manager on Windows, and that is the stated inspiration — but written natively for macOS rather than ported.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [The Unarchiver](/software/files/the-unarchiver/) | Free | Extracts nearly anything, and only extracts |
| [Keka](https://www.keka.io/) | Open source | Creates archives too, with no browsing inside one |
| [PeaZip](/software/files/peazip/) | Open source | Encryption and creation, through a Qt interface |
| [7-Zip (p7zip)](/software/files/p7zip/) | Open source | The same formats from a shell, nothing to look at |
| [BetterZip](https://macitbetter.com/) | Paid | The long-standing commercial answer to this |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask macpacker
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the project site](https://macpacker.app/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://macpacker.app/" title="macpacker.app" icon="globe-alt" subtitle="Official site and documentation" >}}
{{< card link="https://formulae.brew.sh/cask/macpacker" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/sarensw/MacPacker" title="sarensw/MacPacker" icon="github" subtitle="Source and releases, GPL-3.0" >}}
{{< /cards >}}
