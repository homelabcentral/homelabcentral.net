---
title: "Macs Fan Control"
weight: 7
description: "Monitor and control every fan and sensor."
---

{{< lead >}}Reads all thermal sensors and lets you set fan speeds by a sensor-based curve.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/macs-fan-control" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://crystalidea.com/macs-fan-control/download" >}}

## What it does

Macs Fan Control lists every fan and temperature sensor the machine reports, and allows two override modes: a constant RPM, or a target temperature for a chosen sensor, with the fan ramping to hold it.

Two situations make it worth having. One is an aftermarket internal SSD whose sensor the firmware does not read, which can leave fans idle while the drive cooks. The other is deliberately running fans harder during a long encode or compile to trade noise for sustained clocks.

{{< callout type="warning" >}}
Setting a constant low RPM defeats the thermal management that protects the hardware. Prefer sensor-based control, and use **Restore defaults** if anything looks wrong — the firmware regains control immediately.
{{< /callout >}}

## Notes

Free for monitoring; a paid licence for the control features. Apple Silicon laptops have fewer fans and more aggressive firmware control, so there is less to adjust than on an Intel Mac.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [TG Pro](https://www.tunabellysoftware.com/tgpro/) | Paid | More granular per-sensor rules and diagnostics |
| [smcFanControl](https://github.com/hholtmann/smcFanControl) | Open source | Older, effectively unmaintained |
| [iStat Menus](/software/monitoring/istat-menus/) | Paid | Monitors fans and sensors but will not control them |
| Leaving it to the firmware | — | The right answer unless a sensor is genuinely unread |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask macs-fan-control
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://crystalidea.com/macs-fan-control/download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://crystalidea.com/macs-fan-control" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/macs-fan-control" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
