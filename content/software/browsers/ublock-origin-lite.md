---
title: "uBlock Origin Lite"
weight: 4
description: "Content blocker for Safari."
---

{{< lead >}}Raymond Hill's blocker, rebuilt for the declarative extension API Safari and Chrome now require.{{< /lead >}}

{{< badge content="Mac App Store" color="purple" icon="shopping-bag" size="lg" link="https://apps.apple.com/us/app/id6745342698" >}}

## What it does

uBO Lite blocks ads and trackers using declarative rulesets registered with the browser rather than a script inspecting each request. The default ruleset matches uBlock Origin's default filter lists, with optional lists selectable per region and category.

The Lite design is a consequence of Manifest V3: the browser enforces the rules, the extension cannot see your traffic, and there is no per-request scripting. That is better for privacy and performance, at the cost of the dynamic filtering and element-picker power of full uBlock Origin.

## Notes

Configured per site from the toolbar popup, with three modes — basic, optimal and complete. Escalating a site to complete mode is the fix when something still gets through.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [uBlock Origin](https://github.com/gorhill/uBlock) | Open source | The full version, still available on Firefox with dynamic filtering |
| [AdGuard for Safari](https://adguard.com/en/adguard-safari/overview.html) | Free | Its own filter management app |
| [Wipr 2](https://kaylees.site/wipr/) or [1Blocker](https://1blocker.com/) | Paid | Safari blockers with curated lists |
| [Pi-hole](https://pi-hole.net/) or [AdGuard Home](https://adguard.com/en/adguard-home/overview.html) | Open source | Network-level blocking that covers every device |
{{< /borderless-table >}}

## Install

[uBlock Origin Lite on the App Store](https://apps.apple.com/us/app/id6745342698)

Or with `mas`:

```shell
mas install 6745342698
```

## Links

{{< cards cols="2" >}}
{{< card link="https://apps.apple.com/us/app/id6745342698" title="Mac App Store" icon="shopping-bag" subtitle="Free on the Mac App Store" >}}
{{< card link="https://github.com/uBlockOrigin/uBOL-home" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
