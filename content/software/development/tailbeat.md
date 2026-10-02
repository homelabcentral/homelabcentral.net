---
title: "TailBeat"
weight: 12
description: "Native log viewer for Apple platforms, with an MCP server."
---

{{< lead >}}Streams OSLog from any Apple device or Simulator into a window that stays fast at millions of rows — and exposes the same view to a coding agent over MCP.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://tailbeat.dev" >}}

## What it does

TailBeat is Console.app's job done properly. Pick a process in the sidebar and the whole-system firehose collapses to one app's lines with no predicate to write; search is a field-and-range query language that tab-completes and narrows as you type; filters you run daily can be saved. Sources sit side by side — a connected iPhone, iPad, Mac, Watch or Apple TV, a Simulator, or a saved `.logarchive` — and memory stays flat into the millions of rows.

`TailBeatKit` mirrors the `Logger` API, so swapping `import OSLog` for `import TailBeat` leaves every call site alone and each message arrives carrying its file, line, function, category and metadata. Clicking a row jumps to that spot in Xcode. It also plugs into `swift-log` as a backend.

The part worth the install if you work with coding agents is the MCP server. An agent queries the specific log rows rather than streaming the whole thing — the vendor measures that at 96% fewer tokens — so a change can be verified against what actually ran rather than against an assumption. An agent skill ships alongside it.

## Notes

- Subscription: personal is €49 a year or €9 a month, teams €10 per seat per month, after a 7-day trial.
- **macOS 26 or later**, which is steeper than anything else in this section.
- No Homebrew cask — the `.dmg` comes from the site.
- Logs are read locally. Nothing is uploaded, and the MCP server is local too.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| Console.app | Built in | Already installed, and hopeless past a few thousand rows |
| `log stream` and `log show` | Built in | Scriptable, with predicate syntax to write by hand |
| Xcode's debug console | Built in | Only while attached, and gone when you stop |
| [Bugfender](https://bugfender.com/) | Subscription | Logs from users' devices in the field, not from yours |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Direct download" selected=true >}}

[Download the .dmg from the project site](https://tailbeat.dev)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://tailbeat.dev" title="tailbeat.dev" icon="globe-alt" subtitle="Official site, pricing and changelog" >}}
{{< card link="https://www.leanbytes.io/#tailbeat" title="leanbytes.io" icon="briefcase" subtitle="The vendor's product page" >}}
{{< /cards >}}
