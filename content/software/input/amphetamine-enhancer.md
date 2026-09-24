---
title: "Amphetamine Enhancer"
weight: 7
description: "Adds abilities Amphetamine cannot have as a sandboxed app."
---

{{< lead >}}A helper that gives Amphetamine a closed-display fail-safe and visibility of all running processes.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/x74353/Amphetamine-Enhancer/releases" >}}

## What it does

Amphetamine is distributed through the App Store, so it is sandboxed and cannot see the full process list or act as a watchdog on itself. Amphetamine Enhancer is not sandboxed and fills those two gaps:

- **Closed-display mode fail-safe** — periodically checks whether Amphetamine is running and whether a session is active, so a Mac reverts to sleeping with the lid closed if something went wrong.
- **All running processes** — installs a script that periodically writes a list of every running app and process to a file Amphetamine can read, so Triggers and app-based sessions can react to processes the sandbox hides.

## Notes

- Free and open source, from the same community around Amphetamine, but a **separate developer** to Amphetamine itself.
- Not in Homebrew — download from GitHub Releases.
- Only worth installing if you actually use closed-display mode or process-based Triggers. Otherwise Amphetamine alone is enough.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [KeepingYouAwake](https://keepingyouawake.app/) or `caffeinate` | Open source / Built in | Not sandboxed to begin with, so they need no companion |
| Nothing else | — | It exists specifically to extend Amphetamine, and only makes sense alongside it |
{{< /borderless-table >}}

## Install

[Releases on GitHub](https://github.com/x74353/Amphetamine-Enhancer/releases)

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/x74353/Amphetamine-Enhancer" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/x74353/Amphetamine-Enhancer" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
