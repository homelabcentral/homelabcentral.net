---
title: "BetterDisplay"
weight: 9
description: "Display management: resolutions, HiDPI, dummy displays and brightness."
---

{{< lead >}}Unlocks resolutions macOS hides, adds HiDPI modes, and creates virtual displays.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/betterdisplay" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/waydabber/BetterDisplay/releases" >}}

## What it does

BetterDisplay takes over what macOS's Displays panel deliberately simplifies:

- **Custom and HiDPI resolutions** on monitors macOS refuses to offer them for — the fix for a 1440p or ultrawide panel stuck with blurry scaling.
- **Virtual and dummy displays**, which give a headless Mac a desktop to render, or provide a fixed-size screen to record or stream.
- **Brightness and contrast over DDC** for external monitors, controlled by the normal keys.
- **Picture-in-picture mirroring** of one display into a window on another.
- **XDR and HDR handling** on panels that support it.

## Notes

Paid with a free tier; most of the resolution work is in the free feature set. Some features need a helper with elevated privileges. Overriding EDID data is powerful and occasionally confuses macOS after a reboot — the app can revert everything.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [SwitchResX](https://www.madrau.com/) | Paid | The long-standing resolution and EDID tool |
| [MonitorControl](https://github.com/MonitorControl/MonitorControl) | Open source | DDC brightness and volume only |
| [Lunar](https://lunar.fyi/) | Freemium | Focused on brightness automation and adaptive dimming |
| [displayplacer](https://github.com/jakehilborn/displayplacer) | Open source | CLI, for scripting display arrangement and modes |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask betterdisplay
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/waydabber/BetterDisplay/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://betterdisplay.pro/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/betterdisplay" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/waydabber/BetterDisplay/wiki" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
