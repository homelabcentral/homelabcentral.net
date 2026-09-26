---
title: "Parallels Desktop"
weight: 2
description: "Commercial virtual machines with tight macOS integration."
---

{{< lead >}}The virtual machine you buy when you want Windows to stop feeling like a virtual machine.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/parallels" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.parallels.com/products/desktop/download/" >}}

## What it does

Parallels runs Windows, Linux and older macOS as virtual machines on Apple's hypervisor, and then spends its effort on the seams: Coherence puts Windows application windows on the Mac desktop with no VM window around them, the clipboard and Retina scaling work, folders are shared both ways, and a Windows program can be the default handler for a file type in Finder.

Setup is one button — it downloads and installs Windows 11 ARM itself, licence included in the purchase path.

## Notes

- Apple Silicon means ARM guests. Windows 11 ARM runs x86 and x64 applications through Microsoft's own emulation, which handles most software and not games with anti-cheat.
- Sold per year as a subscription, or as a perpetual licence for one major version. Free for personal use on nothing.
- The **Pro** tier is the one with the network conditioner, nested virtualization and a `prlctl` CLI worth scripting against.
- Its hardware graphics support is why it, rather than [UTM](/software/virtualization/utm/), is the answer when a guest needs a working GPU.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [UTM](/software/virtualization/utm/) | Open source | Free, does x86 emulation too, far rougher integration |
| [VMware Fusion](https://www.vmware.com/products/desktop-hypervisor.html) | Free | Free for everyone now, weaker Windows-on-ARM story |
| [VirtualBox](https://www.virtualbox.org/) | Open source | Apple Silicon support is still a developer preview |
| [Docker Desktop](/software/toolchains/docker-desktop/) | Freemium | For a Linux environment rather than a Linux desktop |
| [Windows App](/software/networking/windows-app/) | Free | Use a Windows machine that already exists, over RDP |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask parallels
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.parallels.com/products/desktop/download/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.parallels.com/products/desktop/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/parallels" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://kb.parallels.com/" title="Documentation" icon="book-open" subtitle="Knowledge base" >}}
{{< /cards >}}
