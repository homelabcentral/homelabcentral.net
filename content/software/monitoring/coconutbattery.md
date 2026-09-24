---
title: "coconutBattery"
weight: 6
description: "Live battery health for Macs and connected Apple devices."
---

{{< lead >}}Design capacity versus current capacity, cycle count, temperature and charge wattage — for the Mac and anything plugged into it.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/coconutbattery" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://www.coconut-flavour.com/coconutbattery/" >}}

## What it does

coconutBattery reads battery telemetry: current full-charge capacity against the design figure, cycle count, manufacture date, temperature, voltage, and live charge or discharge wattage. Connect an iPhone or iPad and it reports the same for that device over USB.

The Plus version adds history tracking over time and reading iOS devices over Wi-Fi, which turns it from a snapshot into a record of how a battery is actually aging.

## Notes

macOS's own **System Settings → Battery → Battery Health** gives a rounded percentage and a condition word. This gives the numbers those are derived from, which is what you want before deciding a battery is worth replacing.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [AlDente](https://apphousekitchen.com/) | Freemium | It limits charging rather than only reporting on it |
| [Battery Toolkit](https://github.com/mhaeuser/Battery-Toolkit) | Open source | Charge limiting |
| System Settings → Battery → Battery Health | Built in | A rounded figure and a condition word |
| `system_profiler SPPowerDataType` | Built in | The same raw numbers, no app |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask coconutbattery
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.coconut-flavour.com/coconutbattery/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.coconut-flavour.com/coconutbattery/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/coconutbattery" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
