---
title: "balenaEtcher"
weight: 10
description: "Flash OS images to SD cards and USB drives."
---

{{< lead >}}Writes an image to removable media, with validation, and without letting you pick the wrong disk.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/balenaetcher" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://etcher.balena.io/" >}}

## What it does

Etcher takes an image (`.iso`, `.img`, `.dmg`, compressed archives) and writes it to a selected removable device, verifying the result afterwards. It refuses to list internal drives by default, which is the feature — a mistyped `dd` target destroys the system disk, and this cannot.

For a homelab it is the step before every Raspberry Pi, Proxmox host and router flash.

## Notes

- Electron-based and heavier than the job warrants, but the guard rails justify it.
- The command-line equivalent, for when you are certain:

```shell
diskutil list                       # identify the disk, carefully
diskutil unmountDisk /dev/disk4
sudo dd if=image.img of=/dev/rdisk4 bs=4m status=progress
```

{{< callout type="warning" >}}
With `dd` there is no confirmation and no undo — the wrong `of=` target overwrites whatever is there, including your startup disk. Verify the identifier with `diskutil list` immediately before running it, or use Etcher and let it refuse for you.
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Raspberry Pi Imager](https://www.raspberrypi.com/software/) | Open source | Better for Pi work: it writes Wi-Fi and SSH settings into the image |
| [Ventoy](https://www.ventoy.net/) | Open source | One USB stick that boots many ISOs, no reflashing between them |
| `dd` | Built in | Already installed, no guard rails whatsoever |
| [UNetbootin](https://unetbootin.github.io/) | Open source | Older, still works, mainly for Linux installers |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask balenaetcher
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://etcher.balena.io/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://etcher.balena.io/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/balenaetcher" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/balena-io/etcher" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
