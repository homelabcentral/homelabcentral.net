---
title: "Cemu"
weight: 7
description: "Wii U emulator, open source and running on macOS through Vulkan."
---

{{< lead >}}The Wii U emulator, not a Switch one — worth keeping straight, because half the Switch library started here.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://cemu.info/" >}}

## What it does

Cemu emulates the Wii U. It began as closed-source Windows software in 2015 and was relicensed under the Mozilla Public License in 2022, which is when the Linux and macOS ports became possible at all.

The reason it belongs next to the Switch emulators rather than filed away as a curiosity is the overlap in libraries. *Breath of the Wild*, *Mario Kart 8*, *Splatoon*, *Super Mario 3D World* and *Wind Waker HD* were Wii U titles first, and Cemu runs them at a maturity the Switch emulators are still working towards.

## macOS support

The Mac build renders through Vulkan translated by MoltenVK, since the Wii U's GPU model does not map onto Metal directly. It works, and it is slower and less complete than the Windows build — the port is genuinely secondary, not merely newer.

## The Homebrew name collision

{{< callout type="warning" >}}
`brew install --cask cemu` does **not** install this. The `cemu` cask is **CEmu**, a TI-84 Plus CE graphing calculator emulator, and the name was taken long before anyone tried to package the Wii U one:

```shell
brew info --cask cemu
# ==> cemu (CEmu): 2.0
# TI-84 Plus CE and TI-83 Premium CE calculator emulator
```

There is no Homebrew route to the Wii U emulator. Download it from `cemu.info`.
{{< /callout >}}

## Legal position

Emulation itself is lawful in most jurisdictions. Obtaining the console's system files or game images from anywhere other than hardware and discs you own is not. Cemu ships none of them.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Dolphin](/software/virtualization/dolphin/) | Open source | GameCube and Wii rather than Wii U, and further along on macOS |
| [Ryujinx](/software/virtualization/ryujinx/) | Open source | The Switch ports of these same games, at lower maturity |
| A Wii U | Paid | Discontinued in 2017, and the eShop closed in 2023 |
{{< /borderless-table >}}

## Install

Direct download only, as a `.dmg` for macOS. Windows and Linux builds are published alongside it, including an AppImage.

## Links

{{< cards cols="2" >}}
{{< card link="https://cemu.info/" title="Homepage" icon="globe-alt" subtitle="Downloads and compatibility list" >}}
{{< card link="https://github.com/cemu-project/Cemu" title="Repository" icon="github" subtitle="Source, issues and releases" >}}
{{< /cards >}}
