---
title: "Amphetamine"
weight: 6
description: "Keep the Mac awake, on rules rather than a toggle."
---

{{< lead >}}Prevents sleep — optionally until a condition stops being true, rather than until you remember to turn it off.{{< /lead >}}

{{< badge content="Mac App Store" color="purple" icon="shopping-bag" link="https://apps.apple.com/us/app/id937984704" >}}

## What it does

Amphetamine keeps the Mac, and optionally its displays, awake. What distinguishes it from `caffeinate` is **Triggers**: sessions that start and end on conditions rather than manually.

- While a specific app is running, or is frontmost.
- While a drive is mounted, or a display is connected.
- While on a named Wi-Fi network, or on AC power.
- While CPU or network activity is above a threshold.
- For a duration, or until a time.

Closed-display mode keeps a laptop working with the lid shut and no external display attached.

## Notes

Free on the App Store, and sandboxed as a consequence — which is why [Amphetamine Enhancer](/software/input/amphetamine-enhancer/) exists. The command-line equivalent for a single job is `caffeinate -dimsu -t 3600`.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| `caffeinate` | Built in | Built into macOS: `caffeinate -dimsu -t 3600` and nothing to install |
| [KeepingYouAwake](https://keepingyouawake.app/) | Open source | A menu bar toggle over `caffeinate` |
| [Lungo](https://sindresorhus.com/lungo) or [Theine](https://apps.apple.com/app/id955848755) | Freemium | The same toggle, App Store, paid or free |
{{< /borderless-table >}}

## Install

[Amphetamine on the Mac App Store](https://apps.apple.com/us/app/id937984704)

Or with `mas`:

```shell
mas install 937984704
```

## Links

{{< cards cols="2" >}}
{{< card link="https://apps.apple.com/us/app/id937984704" title="Mac App Store" icon="shopping-bag" subtitle="Free on the Mac App Store" >}}
{{< card link="https://apps.apple.com/us/app/amphetamine/id937984704" title="Homepage" icon="globe-alt" subtitle="App Store listing" >}}
{{< /cards >}}
