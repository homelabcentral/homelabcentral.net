---
title: "idb-companion"
weight: 9
description: "Companion server for automating iOS simulators."
---

{{< lead >}}Meta's iOS Development Bridge daemon — scripted control of simulators and devices.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://github.com/facebook/homebrew-fb" >}}

## What it does

`idb` is an `adb`-shaped interface for iOS. The companion is the per-target daemon that does the actual work: installing and launching apps, streaming logs and video, tapping and swiping, dumping the accessibility tree, and managing simulator lifecycle.

It is the layer UI-test automation and screenshot pipelines drive, because it exposes the simulator as a scriptable service rather than a GUI.

## Notes

- Available from the `facebook/fb` tap.
- The companion is the native half; the `idb` client itself is a Python package (`pip install fb-idb`).
- Needs a matching Xcode install — it links against the simulator frameworks.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Appium with XCUITest](https://appium.io/) | Open source | The cross-platform standard for mobile UI automation |
| [Maestro](https://www.maestro.dev/) | Freemium | Much simpler YAML flows, increasingly the default for new projects |
| `xcrun simctl` | Built in | Built into Xcode, enough for boot, install, launch and screenshots |
{{< /borderless-table >}}

## Install

```shell
brew tap facebook/fb
brew install facebook/fb/idb-companion
```

## Links

{{< cards cols="2" >}}
{{< card link="https://fbidb.io/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/facebook/idb" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://fbidb.io/docs/installation" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
