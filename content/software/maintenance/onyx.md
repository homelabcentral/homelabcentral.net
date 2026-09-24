---
title: "OnyX"
weight: 7
description: "Verify system structure and run macOS maintenance tasks."
---

{{< lead >}}A front end for the maintenance, cache and verification commands macOS hides.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/onyx" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.titanium-software.fr/en/onyx.html" >}}

## What it does

OnyX exposes system operations that otherwise need a terminal or do not surface at all: verifying the startup disk and the SMART status, running the periodic maintenance scripts, rebuilding caches and the Launch Services database, clearing font and icon caches, and toggling dozens of hidden preferences across Finder, Dock, Safari and Spotlight.

Its most common use is the last resort for interface misbehaviour — wrong icons, a Finder that will not refresh, a Dock that has forgotten something — where a cache rebuild fixes it.

## Notes

- **A version is tied to a macOS release.** Running a build made for a different major version is explicitly unsupported by the developer. Check before upgrading macOS.
- Free, from Titanium Software.
- Many actions require a restart or log out to take effect, which is expected rather than a failure.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Maintenance](https://www.titanium-software.fr/en/maintenance.html) | Free | The same developer's cut-down version, fewer sharp edges |
| [CleanMyMac](https://macpaw.com/cleanmymac) | Paid | Broader, with monitoring |
| `sudo periodic daily weekly monthly` | Built in | The maintenance scripts, run directly |
| Safe-mode boot | Built in | Rebuilds most caches macOS can rebuild, with nothing installed |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask onyx
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.titanium-software.fr/en/onyx.html)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.titanium-software.fr/en/onyx.html" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/onyx" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
