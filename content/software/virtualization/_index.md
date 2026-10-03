---
title: "Virtualization & Emulation"
weight: 20
description: "Virtual machines, installer media, and emulating other architectures and consoles."
---

{{< lead >}}Running other operating systems, other architectures and other consoles on a Mac, without buying any of them.{{< /lead >}}

Five of these emulate the Switch, which is more than the rest of the consoles combined and not a sign of health. Nintendo's 2024 action against [Yuzu](/software/virtualization/yuzu/) scattered the effort into forks and continuations, each hosting itself somewhere different; the group below is best read as one project's wreckage rather than as a field of competitors.

Apple Silicon complicates this: native virtualization is fast but ARM-only, and anything x86 has to be emulated instead. UTM covers both paths, Parallels covers Windows properly, and the rest of the list emulates consoles rather than computers.

{{< cards cols="3" >}}
{{< card link="utm" title="UTM" icon="server" subtitle="Virtual machines on macOS, built on QEMU." >}}
{{< card link="parallels" title="Parallels Desktop" icon="desktop-computer" subtitle="Commercial VMs with tight macOS integration." >}}
{{< card link="crystalfetch" title="CrystalFetch" icon="download" subtitle="Build a Windows installer ISO on macOS." >}}
{{< card link="openemu" title="OpenEmu" icon="collection" subtitle="One Mac-native front end over dozens of emulator cores." >}}
{{< card link="retroarch" title="RetroArch" icon="puzzle" subtitle="Libretro front end — every core, one interface." >}}
{{< card link="dolphin" title="Dolphin" icon="puzzle" subtitle="GameCube and Wii emulator, mature and native." >}}
{{< card link="cemu" title="Cemu" icon="puzzle" subtitle="Wii U emulator, open source since 2022." >}}
{{< card link="ryujinx" title="Ryujinx" icon="puzzle" subtitle="Nintendo Switch emulator written in C#." >}}
{{< card link="citron" title="Citron" icon="puzzle" subtitle="Switch emulator continuing the Yuzu codebase." >}}
{{< card link="astris" title="Astris" icon="puzzle" subtitle="Switch emulator built for Apple Silicon Macs." >}}
{{< card link="nxemu" title="NXEmu" icon="puzzle" subtitle="Switch emulator in C++, Windows only." >}}
{{< card link="yuzu" title="Yuzu" icon="archive" subtitle="Shut down in 2024, and why the rest look like this." >}}
{{< card link="melonds" title="melonDS" icon="puzzle" subtitle="Nintendo DS and DSi emulator focused on accuracy." >}}
{{< card link="pcsx2" title="PCSX2" icon="puzzle" subtitle="PlayStation 2 emulator, native on Apple Silicon." >}}
{{< card link="ppsspp" title="PPSSPP" icon="puzzle" subtitle="PSP emulator, fast and near-complete." >}}
{{< card link="duckstation" title="DuckStation" icon="puzzle" subtitle="PlayStation 1 emulator with accurate timing." >}}
{{< /cards >}}

{{< callout type="info" >}}
Every emulator here needs software you supply. Emulation itself is lawful in most jurisdictions; obtaining a console's BIOS, firmware or games from anywhere other than hardware and media you own is not, and none of these projects ship any of it. The Switch is the unsettled case — [Yuzu](/software/virtualization/yuzu/) is what happened when it was tested in court.
{{< /callout >}}
