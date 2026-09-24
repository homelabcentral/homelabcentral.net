---
title: "macFUSE"
weight: 6
description: "Filesystem in Userspace for macOS."
---

{{< lead >}}The kernel extension that lets third-party filesystems be implemented as ordinary programs.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/macfuse" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://macfuse.github.io/" >}}

## What it does

macFUSE (formerly OSXFUSE) provides the FUSE API on macOS, so a filesystem can be written as a user-space process rather than a kernel driver. Things built on it include NTFS write support, SSHFS, S3 and cloud-storage mounts, and archive-as-filesystem tools.

It is a dependency rather than something used directly — `ntfs-3g` and similar tools need it present.

## Notes

{{< callout type="warning" >}}
macFUSE installs a **kernel extension**, which on Apple Silicon requires reducing Startup Security to *Reduced Security* with third-party kernel extensions allowed, then a reboot. That is a real weakening of the machine's security posture. Install it only if something you actually need depends on it, and prefer alternatives — Mounty for occasional NTFS writes, or a network share — where possible.
{{< /callout >}}

macOS's FSKit framework is Apple's supported replacement for this pattern, and newer filesystem implementations are moving to it.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [FSKit](https://developer.apple.com/documentation/fskit) | Built in | Apple's supported, kernel-extension-free replacement; new filesystems are moving to it |
| A network share (SMB or NFS) | — | No driver, no security trade-off |
| [Mountain Duck](https://mountainduck.io/) or [ExpanDrive](https://www.expandrive.com/expandrive-for-mac/) | Paid | Commercial cloud mounting that avoids the kernel extension |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask macfuse
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://macfuse.github.io/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://macfuse.github.io/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/macfuse" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/macfuse/macfuse" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
