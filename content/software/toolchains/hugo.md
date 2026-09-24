---
title: "Hugo"
weight: 7
description: "Fast static site generator, shipped as a single binary."
---

{{< lead >}}A single Go binary that turns Markdown and templates into the site you are reading.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/hugo" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/gohugoio/hugo/releases" >}}

## What it does

Hugo reads `content/`, applies Go templates from the theme, and writes a static `public/` directory. Builds are fast enough that `hugo server` with live reload is the normal authoring loop.

The **extended** edition — which Homebrew installs — adds the embedded LibSass compiler and WebP support. Many themes require it, and a site that needs it fails outright on the plain edition rather than degrading.

## Themes as modules

Hugo can resolve a theme through **Hugo Modules** — Go's module system — rather than vendoring it or adding a submodule. The theme is declared in `go.mod`, downloaded into Hugo's module cache, and upgraded with one command, so there is no `themes/` directory to keep in sync. That requires [Go](/software/toolchains/go/) to be installed.

## Notes

- `hugo server -D -F` is the authoring loop: drafts, future-dated content and live reload. Drop the flags to see what would actually publish.
- `enableGitInfo: true` makes the build hard-require a real Git repository — a shallow clone produces wrong dates, and no repository at all aborts the build.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Eleventy](https://www.11ty.dev/) | Open source | As flexible, JavaScript-based, far smaller ecosystem of themes |
| [Astro](https://astro.build/) | Open source | Component-driven, better when the site needs real interactivity |
| [Jekyll](https://jekyllrb.com/) | Open source | The original, and what GitHub Pages builds natively |
| [Zola](https://www.getzola.org/) | Open source | A single Rust binary with the same no-dependencies appeal |
| [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) or [Docusaurus](https://docusaurus.io/) | Open source | Documentation-specific, batteries included |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install hugo
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Binaries on GitHub Releases](https://github.com/gohugoio/hugo/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://gohugo.io/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/hugo" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/gohugoio/hugo" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://gohugo.io/documentation/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
