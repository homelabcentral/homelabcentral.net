---
title: "Google Chrome"
weight: 2
description: "Chrome, for compatibility and DevTools."
---

{{< lead >}}The reference Chromium build — what most of the web is actually tested against.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/google-chrome" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.google.com/chrome/" >}}

## What it does

Chrome is where DevTools features land first — the Lighthouse panel, performance traces, coverage, the network waterfall with throttling profiles. For front-end work it is the baseline, and for anything that has to work for the general public it is the browser most of that public is using.

It is also the profile that keeps Google service logins, which is why the Docs, Sheets and Slides shortcuts in `/Applications` are Chrome web apps.

## Extensions

Manifest V3 changed what an extension can do here: blocking `webRequest` is gone, so a content blocker now submits a capped set of declarative rules instead of inspecting traffic. That is why the list below differs from the [Firefox](/software/browsers/firefox/) one — same jobs, weaker versions of a few of them.

### Blocking and privacy

{{< borderless-table >}}
| Extension | Does |
| --- | --- |
| [uBlock Origin Lite](https://chromewebstore.google.com/detail/ddkjiahejlhfcafbddmgiahcphecmpfh) | The MV3 build. Full uBlock Origin no longer runs on Chrome at all — see the [Safari notes](/software/browsers/ublock-origin-lite/) for the same trade-off |
| [Privacy Badger](https://chromewebstore.google.com/detail/pkehgijcmpdhfbdbbnkijodmdjhbjlgp) | Learns which third parties track across sites and blocks those, rather than working from a list |
| [PopUpOFF](https://chromewebstore.google.com/detail/ifnkdbpmgkdbfklnbfidaackdenlmhgh) | Kills overlays, cookie walls and newsletter modals, with a per-site aggressiveness setting |
| [DuckDuckGo Search & Tracker Protection](https://chromewebstore.google.com/detail/bkdgflcldnnnapblkhphbgpggdiikppg) | DuckDuckGo as the search default, plus tracker blocking and an email alias service |
| [User-Agent Switcher and Manager](https://chromewebstore.google.com/detail/bhchdcejhohfmigjafbampogmaanbfkg) | Spoof the user agent per site, for the pages that refuse a browser by name |
| [FastForward](https://github.com/FastForwardTeam/FastForward/releases) | Skips link shorteners and gateway pages. Pulled from the Web Store, so it loads unpacked from a release build |
{{< /borderless-table >}}

### Credentials and keeping things

{{< borderless-table >}}
| Extension | Does |
| --- | --- |
| [Bitwarden](https://chromewebstore.google.com/detail/nngceckbapebfimnlniiiahkandclblb) | Autofill from the [Bitwarden](/software/security/bitwarden/) vault, including TOTP codes |
| [Karakeep](https://chromewebstore.google.com/detail/kgcjekpmcjjogibpjebkhaanilehneje) | One-click save to a self-hosted Karakeep instance, which archives and tags the page |
| [Linkwarden](https://chromewebstore.google.com/detail/pnidmkljnhbjfffciajlcpeldoljnidn) | The same idea for Linkwarden — a bookmark manager that keeps a full snapshot |
| [Tab Session Manager](https://chromewebstore.google.com/detail/iaiomicjabeggjcfkbimgmglanimpnae) | Save and restore whole windows of tabs, with automatic periodic snapshots |
{{< /borderless-table >}}

### Downloading and capture

{{< borderless-table >}}
| Extension | Does |
| --- | --- |
| [Video Download Helper](https://chromewebstore.google.com/detail/lmjnegcaeklhafolokijcfjliaokphfk) | Detects media on a page and downloads it. Needs the [companion app](/software/media/vdhcoapp/) for anything that has to be muxed |
| [MeTube Downloader](https://chromewebstore.google.com/detail/fbmkmdnlhacefjljljlbhkodfmfkijdh) | Sends the current URL to a self-hosted MeTube server, which runs [yt-dlp](/software/media/yt-dlp/) for you |
| [FireShot](https://chromewebstore.google.com/detail/mcbpblocgmgfnpjjppndjkmgjaogfceg) | Full-page screenshots, including the part below the fold |
{{< /borderless-table >}}

### Sites worth improving

{{< borderless-table >}}
| Extension | Does |
| --- | --- |
| [Refined GitHub](https://chromewebstore.google.com/detail/hlepfoohegkhhmjieoechaddaejaokhf) | Dozens of small GitHub fixes — one-click merge conflict resolution, linked issue previews, a usable diff |
| [SteamDB](https://chromewebstore.google.com/detail/kdbmhfkmnlmbkgbabkdealhhbfhlmmon) | Price history, real review scores and Steam Deck compatibility, inline on the store page |
| [Augmented Steam](https://chromewebstore.google.com/detail/dnhpnfgdlenaccegplpojghhmaamnnfp) | Store and library additions — lowest recorded price, wishlist tools, region comparisons |
| [Keepa](https://chromewebstore.google.com/detail/neebplgakaahbhdphmkckjjcegoiijjo) | Amazon price history as a chart on the product page, with drop alerts |
{{< /borderless-table >}}

### Changing how pages behave

{{< borderless-table >}}
| Extension | Does |
| --- | --- |
| [Tampermonkey](https://chromewebstore.google.com/detail/dhdgffkkebhmkfjojejmpbldmpobfkfo) | Runs userscripts against matching pages. Anything the other extensions do not cover |
| Installing a site as an app | Built into Chrome — **⋮ → Cast, save and share → Install page as app**. Firefox needs an extension for this; Chrome does not |
{{< /borderless-table >}}

Two Chrome-specific notes. Extensions are per profile, so an extension installed in the work profile is not present in the personal one — deliberate, and the reason profile switching is worth using rather than fighting. And an extension pulled from the Web Store can still be loaded from disk: unzip the release, then **chrome://extensions → Developer mode → Load unpacked**. It will not auto-update, and Chrome nags about it on every launch.

{{< callout type="warning" >}}
An extension sees every page you visit, and updates silently. Extensions change hands, and a popular one bought by an ad network is a recurring story. Install few, prefer ones with source you can read, and review the permission prompt — "read and change all your data on all websites" is exactly what it says.
{{< /callout >}}

## Notes

Chrome auto-updates itself through its own updater (`com.google.keystone`), so Homebrew's version lags and `brew upgrade` is largely ceremonial. Headless Chrome from this install is also what site crawlers and screenshot tools drive.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Chromium](https://www.chromium.org/) | Open source | The same engine without Google's proprietary additions |
| [Microsoft Edge](https://www.microsoft.com/edge) | Built in | Chromium with Microsoft's services and vertical tabs |
| [Brave](/software/browsers/brave-browser/) or [Vivaldi](https://vivaldi.com/) | Open source / Free | Chromium with privacy or customisation layered on |
| [Safari](https://www.apple.com/safari/) | Built in | Better battery life on a Mac, and the only engine iOS actually runs |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask google-chrome
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.google.com/chrome/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.google.com/chrome/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/google-chrome" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://developer.chrome.com/docs/devtools/" title="Documentation" icon="book-open" subtitle="DevTools documentation" >}}
{{< /cards >}}
