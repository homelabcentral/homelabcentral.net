---
title: "UTM"
weight: 1
description: "Virtual machines on macOS, built on QEMU."
---

{{< lead >}}Runs ARM guests at near-native speed through Apple's hypervisor, and x86 guests by emulation.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/utm" >}} {{< badge content="Mac App Store" color="purple" icon="shopping-bag" link="https://apps.apple.com/us/app/utm-virtual-machines/id1538878817" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://mac.getutm.app/" >}}

## What it does

UTM is a macOS front end for QEMU with two distinct modes:

- **Virtualize** — uses Apple's Virtualization framework for guests matching the host architecture. ARM Linux and Windows on ARM run at close to native speed, with shared folders, clipboard sharing and Rosetta available inside Linux guests for x86 binaries.
- **Emulate** — full QEMU emulation for other architectures: x86-64, RISC-V, PowerPC, older ARM. Correct, and slow.

For lab work it is the fastest way to try a distribution, test an installer, or keep a throwaway machine for something you do not want on the host.

## Notes

- There is a paid App Store build; the Homebrew cask and the GitHub download are the same app, free, and self-update.
- The [UTM gallery](https://mac.getutm.app/gallery/) has prebuilt images that skip the installer step entirely.
- Emulated x86 Windows is technically possible and practically painful — use Windows on ARM, or RDP to a real machine.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Parallels Desktop](https://www.parallels.com/products/desktop/) | Paid | Still the smoothest Windows-on-Mac experience |
| [VMware Fusion](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion) | Freemium | Free for personal use, more traditional VM management |
| [Lima](https://lima-vm.io/) or [Tart](https://tart.run/) | Open source | CLI-first Linux and macOS VMs, aimed at CI and automation |
| [Docker](/software/toolchains/docker-desktop/) or [OrbStack](https://orbstack.dev/) | Freemium | Lighter, if a container would do instead of a full VM |
| [VirtualBox](https://www.virtualbox.org/) | Open source | Apple Silicon support remains poor |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask utm
```

{{< /tab >}}
{{< tab name="Mac App Store" >}}

A paid App Store build supports the project: [UTM on the Mac App Store](https://apps.apple.com/us/app/utm-virtual-machines/id1538878817)

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://mac.getutm.app/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://mac.getutm.app/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/utm" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/utmapp/UTM" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://docs.getutm.app/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
