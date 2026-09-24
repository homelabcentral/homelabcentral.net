---
title: "AppCleaner"
weight: 5
description: "Drag an app onto it to uninstall it with its support files."
---

{{< lead >}}The original macOS uninstaller: one window, drag, confirm.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/appcleaner" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://freemacsoft.net/appcleaner/" >}}

## What it does

AppCleaner finds the files associated with an application and offers to delete them alongside the bundle. Its **SmartDelete** watcher notices when an app is dragged to the Trash in Finder and offers the same cleanup automatically.

That automatic prompt is why it stays installed even with Pearcleaner present — it catches the uninstall you did without thinking about it.

## Notes

Free, closed source, and long-standing. It will not find leftovers from apps already deleted; that is Pearcleaner's job.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Pearcleaner](/software/maintenance/pearcleaner/) | Open source | It also finds leftovers from apps already deleted |
| [CleanMyMac](https://macpaw.com/cleanmymac) | Paid | An uninstaller as one module among many |
| `brew uninstall --zap <cask>` | — | The terminal answer for anything Homebrew installed |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask appcleaner
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://freemacsoft.net/appcleaner/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://freemacsoft.net/appcleaner/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/appcleaner" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
