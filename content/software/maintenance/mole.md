---
title: "mole"
weight: 6
description: "Deep clean and optimise a Mac from the command line."
---

{{< lead >}}A CLI cleaner: caches, logs, developer junk and orphaned files, with a dry run first.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/mole" >}}

## What it does

mole scans the usual accumulation points — user and system caches, logs, Xcode derived data and simulators, package manager caches, browser data, orphaned application support directories — reports what it found and how much it would reclaim, and deletes on confirmation.

Being a CLI is the advantage: it is scriptable, scheduleable, and shows exactly which paths it intends to touch instead of a progress bar and a total.

## Notes

{{< callout type="warning" >}}
Any cleaner can delete something you wanted. Run the scan and read the path list before letting it delete, especially where "developer junk" is concerned — Xcode simulator runtimes are large, slow to re-download, and easy to lose by accident.
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [OnyX](/software/maintenance/onyx/) | Free | GUI, more conservative about what it will delete |
| [CleanMyMac](https://macpaw.com/cleanmymac) | Paid | The best-known app in this category |
| [Pearcleaner](/software/maintenance/pearcleaner/) | Open source | Narrower: app leftovers rather than caches and logs |
| Doing nothing | — | macOS purges most caches on its own under disk pressure |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install mole
```

{{< /tab >}}
{{< tab name="Install script" >}}

```shell
curl -fsSL https://mole.fit/install.sh | bash
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://mole.fit" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/mole" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< /cards >}}
