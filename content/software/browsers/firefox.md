---
title: "Firefox"
weight: 3
description: "Independent browser engine."
---

{{< lead >}}Gecko — the one major engine that is neither Chromium nor WebKit.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/firefox" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.mozilla.org/firefox/new/" >}}

## What it does

Firefox's real value is being a second rendering engine. A layout or CSS bug that only appears outside Chromium is invisible until something non-Chromium loads the page, and with Edge, Brave, Arc and Opera all being Chromium, Firefox is the practical way to catch it.

Its own strengths: Total Cookie Protection isolating cookies per site by default, container tabs for keeping identities separate, and a CSS inspector with genuinely better grid and flexbox tooling than Chrome's.

## Extensions

Firefox's extension API is still the more permissive of the two: `webRequest` blocking works, so a content blocker can see and cancel a request rather than hand Chrome a list of rules and hope. Everything below installs from [addons.mozilla.org](https://addons.mozilla.org/).

### Blocking and privacy

{{< borderless-table >}}
| Extension | Does |
| --- | --- |
| [uBlock Origin](https://addons.mozilla.org/firefox/addon/ublock-origin/) | The content blocker. Full `webRequest` version, which Chrome no longer allows |
| [Privacy Badger](https://addons.mozilla.org/firefox/addon/privacy-badger17/) | Learns which third parties track across sites and blocks those, rather than working from a list |
| [PopUpOFF](https://addons.mozilla.org/firefox/addon/popupoff/) | Kills overlays, cookie walls and newsletter modals, with a per-site aggressiveness setting |
| [DuckDuckGo Search & Tracker Protection](https://addons.mozilla.org/firefox/addon/duckduckgo-for-firefox/) | DuckDuckGo as the search default, plus tracker blocking and an email alias service |
| [Facebook Container](https://addons.mozilla.org/firefox/addon/facebook-container/) | Confines Facebook to its own container so its cookies cannot follow you off-site |
| [FastForward](https://addons.mozilla.org/firefox/addon/fastforwardteam/) | Skips link shorteners and "wait 10 seconds" gateway pages |
| [User-Agent Switcher and Manager](https://addons.mozilla.org/firefox/addon/user-agent-string-switcher/) | Spoof the user agent per site, for the pages that refuse a browser by name |
{{< /borderless-table >}}

### Credentials and keeping things

{{< borderless-table >}}
| Extension | Does |
| --- | --- |
| [Bitwarden](https://addons.mozilla.org/firefox/addon/bitwarden-password-manager/) | Autofill from the [Bitwarden](/software/security/bitwarden/) vault, including TOTP codes |
| [Karakeep](https://addons.mozilla.org/firefox/addon/karakeep/) | One-click save to a self-hosted Karakeep instance, which archives and tags the page |
| [Linkwarden](https://addons.mozilla.org/firefox/addon/linkwarden/) | The same idea for Linkwarden — a bookmark manager that keeps a full snapshot |
| [Tab Session Manager](https://addons.mozilla.org/firefox/addon/tab-session-manager/) | Save and restore whole windows of tabs, with automatic periodic snapshots |
{{< /borderless-table >}}

### Downloading and capture

{{< borderless-table >}}
| Extension | Does |
| --- | --- |
| [Video DownloadHelper](https://addons.mozilla.org/firefox/addon/video-downloadhelper/) | Detects media on a page and downloads it. Needs the [companion app](/software/media/vdhcoapp/) for anything that has to be muxed |
| [MeTube Downloader](https://addons.mozilla.org/firefox/addon/metube-downloader/) | Sends the current URL to a self-hosted MeTube server, which runs [yt-dlp](/software/media/yt-dlp/) for you |
| [FireShot](https://addons.mozilla.org/firefox/addon/fireshot/) | Full-page screenshots, including the part below the fold |
{{< /borderless-table >}}

### Sites worth improving

{{< borderless-table >}}
| Extension | Does |
| --- | --- |
| [Refined GitHub](https://addons.mozilla.org/firefox/addon/refined-github-/) | Dozens of small GitHub fixes — one-click merge conflict resolution, linked issue previews, a usable diff |
| [SteamDB](https://addons.mozilla.org/firefox/addon/steam-database/) | Price history, real review scores and Steam Deck compatibility, inline on the store page |
| [Augmented Steam](https://addons.mozilla.org/firefox/addon/augmented-steam/) | Store and library additions — lowest recorded price, wishlist tools, region comparisons |
| [Keepa](https://addons.mozilla.org/firefox/addon/keepa/) | Amazon price history as a chart on the product page, with drop alerts |
{{< /borderless-table >}}

### Changing how pages behave

{{< borderless-table >}}
| Extension | Does |
| --- | --- |
| [Tampermonkey](https://addons.mozilla.org/firefox/addon/tampermonkey/) | Runs userscripts against matching pages. Anything the other extensions do not cover |
| [Progressive Web Apps for Firefox](https://addons.mozilla.org/firefox/addon/pwas-for-firefox/) | Installs sites as standalone apps with their own windows and Dock icons — Firefox has no built-in PWA support, so this adds a native connector to do it |
{{< /borderless-table >}}

{{< callout type="warning" >}}
An extension sees every page you visit, and updates silently. Extensions change hands, and a popular one bought by an ad network is a recurring story. Install few, prefer ones with source you can read, and review the permission prompt — "read and change all your data on all websites" is exactly what it says.
{{< /callout >}}

## Notes

Firefox self-updates. `about:config` still exposes every preference, which is the reason it survives as the browser of choice for people who want to change things Chromium hard-codes.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [LibreWolf](https://librewolf.net/) | Open source | A hardened Firefox fork with telemetry and Pocket stripped out |
| [Waterfox](https://www.waterfox.net/) | Open source | Another fork, more conservative about removing features |
| [Safari](https://www.apple.com/safari/) | Built in | The other non-Chromium engine, and the one iOS users are on |
| [Tor Browser](https://www.torproject.org/download/) | Open source | Firefox-based, for anonymity rather than everyday use |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask firefox
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.mozilla.org/firefox/new/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.mozilla.org/firefox/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/firefox" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/mozilla-firefox/firefox" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://developer.mozilla.org/" title="Documentation" icon="book-open" subtitle="MDN" >}}
{{< /cards >}}
