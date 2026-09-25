---
title: "macUSB"
weight: 11
description: "Guided bootable USB creator for macOS, Windows and Linux media."
---

{{< lead >}}One app for every bootable stick a Mac can make — macOS installers old and new, Windows, Linux, or a raw image written straight to the drive.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/macusb" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/Kruszoneq/macUSB/releases/latest" >}}

## What it does

macUSB walks a bootable-media job from source to ejectable drive. The source can be a local `.app`, `.dmg`, `.cdr`, `.iso` or `.img`, or an installer fetched by the built-in downloader, which lists what Apple's catalogues still publish — including public betas — and can keep the result as a read-only DMG. It then validates the target's capacity, formats it for the chosen workflow, and reports each stage as it runs.

The reason it exists is the awkward end of the range. Building installer media for macOS Catalina and older on an Apple Silicon Mac means dealing with an Intel-only `createinstallmedia`; macUSB detects that, offers to install Rosetta when it is missing, and handles the rest. Support runs back to Mac OS X Tiger, with per-version caveats spelled out in the README rather than discovered at the failure.

It is not macOS-only any more. Windows `.iso` images are identified by family, service pack and architecture, formatted MBR/FAT32, and given the project's own bootloader when the version needs legacy BIOS. An oversized `install.wim` is split into `.swm` parts with `wimlib`, and 64-bit Windows 10 and 11 media can carry a generated `Autounattend.xml` that skips the Microsoft-account requirement, pre-creates a local account, and blocks automatic BitLocker encryption. Linux images get distribution and architecture detection, and anything unrecognised falls back to raw image writing with a SHA-256 verify afterwards.

## Notes

- Needs **Full Disk Access** and **Allow in the Background** in System Settings. Without both, creation fails partway.
- `wimlib` is not bundled — install it only if a Windows image trips the FAT32 4 GB file limit:

```shell
brew install wimlib
```

- External HDD and SSD targets are hidden on every launch and must be re-enabled from **Options** each time, which is the right default for a tool that erases the drive it is pointed at.
- Written in SwiftUI, notarised, MIT-licensed, and localised into thirteen languages.

{{< callout type="warning" >}}
Creating bootable media erases the whole target drive. macUSB shows the identifier and capacity on the confirmation screen — read it before starting, because nothing after that point is recoverable.
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| `createinstallmedia` | Built in | Ships inside the installer, and fails on the legacy combinations macUSB exists for |
| [balenaEtcher](/software/maintenance/balenaetcher/) | Open source | Writes raw images only — no macOS installer or Windows workflow |
| [Mist](/software/maintenance/mist/) | Open source | Downloads the installer but does not write the drive |
| [CrystalFetch](/software/virtualization/crystalfetch/) | Open source | Produces a Windows ISO, which still needs writing afterwards |
| [Rufus](https://rufus.ie/) | Open source | The reference for this job, and Windows-only |
| [Ventoy](https://www.ventoy.net/) | Open source | One stick that boots many ISOs, but no macOS installer handling |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask macusb
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/Kruszoneq/macUSB/releases/latest)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://macusb.app/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/macusb" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/Kruszoneq/macUSB" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/Kruszoneq/macUSBoot" title="macUSBoot" icon="chip" subtitle="The legacy BIOS bootloader it installs" >}}
{{< /cards >}}
