---
title: "Itsycal"
weight: 8
description: "Month calendar in the menu bar."
---

{{< lead >}}A month grid that drops out of the menu bar, with the next few events listed under it.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/itsycal" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.mowglii.com/itsycal/" >}}

## What it does

Itsycal replaces the menu bar clock with a date you can click. The click opens a month grid and, below it, the agenda for the next few days. Events come from Calendar.app through EventKit, so whatever accounts macOS already syncs — iCloud, Google, Exchange — show up with no second login, and an event can be created from the grid without opening the full app.

The date format is a `strftime` string, which is the setting that makes it worth installing: the stock clock offers a short list of layouts, Itsycal lets the bar read exactly `E d MMM HH:mm` or nothing but a date. Apple's own clock is then turned off in **System Settings → Control Centre → Clock Options** so the bar is not showing the time twice.

Calendar access is a permission prompt on first launch. Denied, the grid still works as a calendar — it just has no events in it.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| System Settings → Control Centre → Clock Options | Built in | Date and time, no calendar behind them |
| Calendar.app | Built in | A window to open, not a glance |
| [Fantastical](https://flexibits.com/fantastical) | Freemium | Natural-language entry, and a whole calendar client |
| [Dato](https://sindresorhus.com/dato) | Paid | Time zones and a one-click join for the next meeting |
| [MeetingBar](https://github.com/leits/MeetingBar) | Open source | The next meeting in the bar rather than a month |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask itsycal
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.mowglii.com/itsycal/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.mowglii.com/itsycal/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/itsycal" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/sfsam/Itsycal" title="sfsam/Itsycal" icon="github" subtitle="Source, MIT licensed" >}}
{{< /cards >}}
