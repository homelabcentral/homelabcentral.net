---
title: "SiteOne Crawler"
weight: 5
description: "Crawl a website and audit SEO, performance, accessibility and security."
---

{{< lead >}}Crawls an entire site, scores it, and can export the whole thing to browsable offline HTML.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://github.com/janreges/homebrew-tap" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/janreges/siteone-crawler/releases" >}}

## What it does

SiteOne Crawler walks a site and runs dozens of analyses over what it finds — SEO, performance, accessibility, security headers, best practices, content problems, broken links — then produces an interactive HTML report with a 0.0–10.0 quality score. Reports can also be emitted as JSON or text for CI.

Beyond auditing it can:

- export the site to a **browsable offline archive** of local HTML files, with images, CSS, JS and fonts rewritten to work without a server,
- convert pages to Markdown,
- generate sitemaps,
- render each page in real Chromium via the DevTools Protocol, so JavaScript-heavy and SPA sites crawl correctly.

```shell
siteone-crawler --url=https://example.com
siteone-crawler --url=https://example.com --offline-export-dir=./archive
```

## Notes

Available from the author's tap (`janreges/tap`). There is also a cross-platform GUI build if a report UI is preferable to a terminal. Only crawl sites you own or have permission to test, and keep concurrency low against anything you do not control.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Screaming Frog SEO Spider](https://www.screamingfrog.co.uk/seo-spider/) | Freemium | The commercial standard for crawl-based site audits |
| [Sitebulb](https://sitebulb.com/) | Freemium | Audit-focused, with a heavier reporting layer |
| [Lighthouse](https://developer.chrome.com/docs/lighthouse/overview) and [Lighthouse CI](https://github.com/GoogleChrome/lighthouse-ci) | Free | Per-page scoring rather than whole-site crawling |
| wget --mirror or [HTTrack](https://www.httrack.com/) | Open source | Offline mirroring only, no analysis |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew tap janreges/tap
brew install janreges/tap/siteone-crawler
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Single-binary releases](https://github.com/janreges/siteone-crawler/releases)

{{< /tab >}}
{{< tab name="GUI" >}}

A desktop build is available at [siteone-crawler-gui](https://github.com/janreges/siteone-crawler-gui).

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://crawler.siteone.io/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/janreges/siteone-crawler" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://crawler.siteone.io/introduction/overview/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
