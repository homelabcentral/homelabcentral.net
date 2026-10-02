---
title: "Forel"
weight: 10
description: "Watch folders and sort files by local rules."
---

{{< lead >}}Rules that watch a folder and move, rename, tag or label whatever lands in it, entirely on the machine.{{< /lead >}}

{{< badge content="Homebrew tap" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://github.com/lab421/homebrew-tap" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://forel-app.github.io/" >}}

## What it does

Forel is a menu bar app that watches folders. A rule matches on name, extension, kind, size, date, Finder tag or colour label, and acts by moving, renaming, tagging or labelling — which in practice means Downloads sorting itself instead of growing to four thousand items.

Everything is evaluated on device. There is no account and no telemetry, which is the distinction worth having when the folders being watched are client work.

For the opposite problem — creating a folder structure rather than tidying one — see [Prefab](/software/files/prefab/).

## Notes

The cask lives in the project's own tap rather than `homebrew-cask`, so the install line carries the tap name. `brew upgrade` handles it normally afterwards.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Hazel](https://www.noodlesoft.com/) | Paid | The incumbent, with more conditions and AppleScript actions |
| [Keyboard Maestro](https://www.keyboardmaestro.com/) | Paid | Folder triggers inside a general-purpose macro tool |
| Folder Actions in Automator | Built in | Already installed, and unchanged for a decade |
| `fswatch` with a shell script | Open source | Total control, and you maintain it |
| [Prefab](/software/files/prefab/) | Free | Builds structures instead of sorting into them |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask lab421/tap/forel
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download the .dmg from the project site](https://forel-app.github.io/) or the [GitHub releases page](https://github.com/lab421/forel/releases).

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://forel-app.github.io/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/lab421/forel" title="lab421/forel" icon="github" subtitle="Source and releases, GPL-3.0" >}}
{{< card link="https://github.com/lab421/homebrew-tap" title="lab421/homebrew-tap" icon="cube" subtitle="The tap the cask comes from" >}}
{{< /cards >}}
