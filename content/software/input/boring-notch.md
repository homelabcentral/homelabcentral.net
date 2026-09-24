---
title: "boringNotch"
weight: 5
description: "Turn the MacBook notch into a usable widget."
---

{{< lead >}}Puts media controls, now-playing artwork and shortcuts into the notch area on hover.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://github.com/TheBoredTeam/homebrew-boring-notch" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/TheBoredTeam/boring.notch/releases" >}}

## What it does

boringNotch expands the notch on hover into a panel with now-playing controls and artwork, battery and charging state, a file drop shelf, and quick toggles — Dynamic Island behaviour, on a Mac.

It turns dead screen area into something functional, which is the entire argument for it.

## Notes

- Free and open source, installed from the project's own tap (`theboredteam/boring-notch`).
- Needs **Accessibility** and, for media detection, some additional permissions.
- It draws over the menu bar region, so it can interact oddly with menu bar managers like Vanilla. Configure one, then the other.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [NotchNook](https://lo.cafe/notchnook) | Freemium | The most polished take on the same idea |
| [Alcove](https://tryalcove.com/) | Freemium | Lighter, focused on media and AirDrop |
| [TopNotch](https://topnotch.app/) | Freemium | Solves the opposite problem by blacking the notch out |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew tap theboredteam/boring-notch
brew install --cask theboredteam/boring-notch/boring-notch
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/TheBoredTeam/boring.notch/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/TheBoredTeam/boring.notch" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/TheBoredTeam/boring.notch" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
