---
title: "cliclick"
weight: 21
description: "Emulate mouse clicks and keystrokes from the command line."
---

{{< lead >}}Scriptable mouse and keyboard events, for automating apps that expose no API.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/cliclick" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.bluem.net/en/projects/cliclick/" >}}

## What it does

cliclick synthesises input events: move the cursor, click, double-click, drag, scroll, type a string, press modifiers and key codes. Coordinates are absolute screen pixels, and a `w:` command inserts waits between steps.

```shell
cliclick m:500,300 c:. w:200 t:"hello"
cliclick kd:cmd t:s ku:cmd      # Cmd-S
cliclick p                       # print current cursor position
```

## Notes

- Needs **Accessibility** permission in System Settings; without it commands are accepted and silently do nothing.
- Coordinate-based automation is brittle across display changes. Prefer AppleScript or Shortcuts when the target app is scriptable, and keep cliclick for the ones that are not.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| AppleScript / `osascript` | Built in | Scripts the app properly when the app supports it |
| [Hammerspoon](https://www.hammerspoon.org/) | Open source | Lua, and far more capable for anything conditional |
| [Keyboard Maestro](https://www.keyboardmaestro.com/) | Paid | A recorder and image-based targeting |
| [Shortcuts](https://support.apple.com/guide/shortcuts-mac/welcome/mac) | Built in | The supported route, when the app exposes actions |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install cliclick
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Prebuilt binary](https://www.bluem.net/en/projects/cliclick/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.bluem.net/jump/cliclick/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/cliclick" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/BlueM/cliclick" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
