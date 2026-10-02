---
title: "MacTap"
weight: 9
description: "Knock the chassis to run a shortcut."
---

{{< lead >}}Turns one, two or three knocks on the MacBook — or on the desk beneath it — into actions.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://mactap.vercel.app" >}}

## What it does

MacTap reads the MacBook's motion sensor and watches for taps. One knock, two or three each map to an action: copy, paste, undo, save, play/pause, screenshot, lock, or accepting and rejecting an AI suggestion. A second layout splits left and right edges of the chassis for six slots instead of three, and per-app rules let an editor claim accept/reject/save while everything else keeps the default set.

The appeal is that the hands never leave the keyboard or the mouse, and nothing is bound to a key combination that an application might already want.

## Notes

- **Hardware requirement.** It needs a MacBook whose accelerometer is exposed as an SPU HID device: M2 and later, or M1 Pro/Max/Ultra. The original M1 Air does not publish that report, and MacTap does not fall back to anything else. macOS 14.6 or later.
- Detection works without permissions; **Accessibility** is what lets a detected knock send the action.
- Sensitivity, a cooldown and ignore-while-typing are all settings, which is what keeps normal typing from triggering it.
- No Homebrew cask — the download is the project site or a GitHub release. The app itself is Developer ID signed and notarised, and a `codesign --verify` against the `.dmg` wrapper reporting unsigned is expected rather than a problem.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Karabiner-Elements](/software/input/karabiner-elements/) | Open source | Remaps keys, which still means pressing one |
| [BetterTouchTool](https://folivora.ai/) | Paid | Trackpad and Touch Bar gestures instead of knocks |
| [Keyboard Maestro](https://www.keyboardmaestro.com/) | Paid | Any trigger you can name, except a physical tap |
| A bare keyboard shortcut | Built in | Free, and one more combination to remember |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Direct download" selected=true >}}

[Download from the project site](https://mactap.vercel.app), or take the `.zip` from the [latest GitHub release](https://github.com/jaskirat1616/mactap-app/releases/latest). Unzip, drag `MacTap.app` into `/Applications`, and launch it from there rather than from the disk image.

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://mactap.vercel.app" title="mactap.vercel.app" icon="globe-alt" subtitle="Official site, presets and download" >}}
{{< card link="https://github.com/jaskirat1616/mactap-app" title="jaskirat1616/mactap-app" icon="github" subtitle="Source and releases, MIT licensed" >}}
{{< /cards >}}
