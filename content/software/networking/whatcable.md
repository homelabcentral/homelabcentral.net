---
title: "WhatCable"
weight: 7
description: "Menu bar USB-C cable and port diagnostics."
---

{{< lead >}}Tells you what a USB-C cable and port are actually negotiating, rather than what the packaging claimed.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/whatcable" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/darrylmorley/whatcable/releases" >}}

## What it does

WhatCable reads the USB and Thunderbolt topology and reports what the connection actually is: link speed, whether a device negotiated USB 2.0 instead of 3.x or 4, port and hub layout, and power delivery details — from the menu bar.

USB-C hides all of this behind an identical connector. A cable that charges fine may be USB 2.0 only, which turns an external SSD into something ten times slower than it should be with no error anywhere. This makes that visible in seconds.

## Notes

Available from homebrew-cask but developed on GitHub by an independent author; it self-updates, so the recorded version lags. `system_profiler SPUSBDataType` gives the same underlying data on the command line, considerably less legibly.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| System Information → USB / Thunderbolt | Built in | The same data, badly presented |
| `system_profiler SPUSBDataType` | Built in | The command-line version of that panel |
| A labelled cable drawer | — | Unfashionable, and it prevents the problem outright |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask whatcable
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/darrylmorley/whatcable/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/darrylmorley/whatcable" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/whatcable" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/darrylmorley/whatcable" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
