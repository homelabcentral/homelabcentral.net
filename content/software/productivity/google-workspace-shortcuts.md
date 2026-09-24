---
title: "Google Docs, Sheets & Slides"
weight: 7
description: "Chrome web app shortcuts for the Google editors."
---

{{< lead >}}Not applications — Chrome shortcuts that open the Google editors in their own window.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" >}}

## What it does

`Google Docs.app`, `Google Sheets.app` and `Google Slides.app` in `/Applications` are not native applications. Chrome's **Install page as app** (formerly *Create shortcut*) writes a small bundle that launches Chrome with a fixed URL, no address bar, and its own Dock icon and window.

The effect is that the editors behave like separate apps: Cmd-Tab reaches them, they keep their own window state, and they are not lost among thirty browser tabs.

## Notes

- They depend on the Chrome profile that created them. Removing that profile, or Chrome, breaks them.
- They are not offline-capable beyond what Google's own offline mode provides, and not native — everything runs in Chrome.
- Recreate one from Chrome: open the site, then **⋮ → Cast, save and share → Install page as app**.
- Nothing to install through Homebrew; the only prerequisite is [Google Chrome](/software/browsers/google-chrome/).

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Pages](https://www.apple.com/pages/), [Numbers](https://www.apple.com/numbers/) and [Keynote](https://www.apple.com/keynote/) | Built in | Native, and they open Office formats |
| [Microsoft 365](https://www.microsoft.com/microsoft-365) | Subscription | Real desktop apps, the answer when documents must round-trip with Office users |
| [LibreOffice](https://www.libreoffice.org/) or [OnlyOffice](https://www.onlyoffice.com/) | Open source | Offline, no account |
| Chrome's Install page as app | — | The same trick for any web app, not just Google's |
{{< /borderless-table >}}

## Install

Open [docs.google.com](https://docs.google.com), then **⋮ → Cast, save and share → Install page as app**. Repeat for Sheets and Slides.

## Links

{{< cards cols="2" >}}
{{< card link="https://docs.google.com/" title="Google Docs" icon="document-text" subtitle="The web app itself" >}}
{{< card link="https://sheets.google.com/" title="Google Sheets" icon="table" subtitle="The web app itself" >}}
{{< card link="https://slides.google.com/" title="Google Slides" icon="presentation-chart-bar" subtitle="The web app itself" >}}
{{< /cards >}}
