---
title: "Textream"
weight: 21
description: "Teleprompter that follows your voice."
---

{{< lead >}}Shows a script in an overlay only you can see, and highlights each word as you say it.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/textream" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://textream.net/" >}}

## What it does

Textream is a teleprompter with three scroll modes: word tracking, which listens and highlights each word as it is spoken; classic, which scrolls at a constant speed; and voice-activated, which scrolls while you talk and pauses when you stop. Word tracking is the one that makes it worth installing — a constant-speed prompter forces you to match the scroll, and this matches you.

The script displays as a notch-style overlay at the top of the screen, a draggable floating window, or fullscreen on an iPad over Sidecar. None of it appears in a window capture of another app, so what the audience sees is unaffected.

Paste the script, press play, talk. It closes itself at the end.

## Notes

The core cask is `textream`; the project's own README offers its tap instead, which installs the same app. macOS 15 or later, Apple Silicon or Intel.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [OBS Studio](/software/media/obs/) text source | Open source | Already running for the stream, and scrolls blindly |
| [Teleprompter.com](https://teleprompter.com/) | Freemium | Browser-based, with an account and a subscription |
| [Elgato Prompter](https://www.elgato.com/us/en/p/prompter) | Paid | A screen in front of the lens, so your eyeline is right |
| Notes on a second display | Built in | Free, and visibly off-camera |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask textream
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download the .dmg from the project site](https://textream.net/) or the [GitHub releases page](https://github.com/f/textream/releases/latest).

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://textream.net/" title="textream.net" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/textream" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/f/textream" title="f/textream" icon="github" subtitle="Source and releases, MIT licensed" >}}
{{< /cards >}}
