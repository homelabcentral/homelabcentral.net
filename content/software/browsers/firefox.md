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
