---
title: "Pearcleaner"
weight: 4
description: "Uninstall apps and remove leftovers from ones already gone."
---

{{< lead >}}Open-source uninstaller that also finds the files left behind by apps you deleted long ago.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/pearcleaner" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/alienator88/Pearcleaner/releases" >}}

## What it does

Dragging an app to the Trash leaves its preferences, caches, application support directories, launch agents and logs behind. Pearcleaner removes an app together with those files, and — the part that distinguishes it — scans for **orphaned** files belonging to applications that are no longer installed.

It also inspects app bundles: architecture, whether a universal binary can be lipo'd down, and what is inside.

## Notes

- Free and open source, unlike most of this category.
- Needs **Full Disk Access** to see everything it needs to.
- Review the file list before confirming. Orphan detection is heuristic, and a shared support directory can be attributed to the wrong app.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [AppCleaner](/software/maintenance/appcleaner/) | Free | Simpler, no orphan scanning |
| [CleanMyMac](https://macpaw.com/cleanmymac) | Paid | Does this among many other things, heavier than most people want |
| [AppZapper](https://www.appzapper.com/) or [TrashMe](https://www.jibapps.com/apps/trashme/) | Paid | Uninstallers of the same shape |
| `brew uninstall --zap` | — | For anything installed as a cask, removes support files too |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask pearcleaner
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/alienator88/Pearcleaner/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://itsalin.com/appInfo/?id=pearcleaner" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/pearcleaner" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/alienator88/Pearcleaner" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
