---
title: "System Color Picker"
weight: 4
description: "Pick, convert and store colours from anywhere on screen."
---

{{< lead >}}Sindre Sorhus's colour picker: sample any pixel, get the value in every notation you need.{{< /lead >}}

{{< badge content="Mac App Store" color="purple" icon="shopping-bag" size="lg" link="https://apps.apple.com/us/app/id1545870783" >}}

## What it does

A small app around macOS's built-in colour panel. It samples a colour from anywhere on screen and shows it as Hex, RGB, HSL, LCH and OKLCH, converts between them, keeps recently picked colours, and can be driven entirely from the keyboard with a global shortcut.

For CSS work the OKLCH output is the useful part — it is the notation modern stylesheets increasingly use, and converting by hand is unpleasant.

## Notes

The app name on disk is **Color Picker**. Needs **Screen Recording** permission to sample pixels, which is how any screen colour picker works on macOS.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Sip](https://sipapp.io/) | Paid | The popular paid picker, with palette management and team sharing |
| [ColorSlurp](https://colorslurp.com/) | Freemium | A magnifier and contrast checker |
| [Digital Color Meter](https://support.apple.com/guide/digital-color-meter/welcome/mac) | Built in | Built into macOS, no conversions or history |
{{< /borderless-table >}}

## Install

[System Color Picker on the Mac App Store](https://apps.apple.com/us/app/id1545870783)

Or with `mas`:

```shell
mas install 1545870783
```

## Links

{{< cards cols="2" >}}
{{< card link="https://apps.apple.com/us/app/id1545870783" title="Mac App Store" icon="shopping-bag" subtitle="Free on the Mac App Store" >}}
{{< card link="https://github.com/sindresorhus/System-Color-Picker" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
