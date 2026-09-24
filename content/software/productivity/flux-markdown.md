---
title: "FluxMarkdown"
weight: 3
description: "Markdown previews in Finder Quick Look."
---

{{< lead >}}Press Space on a `.md` file and get rendered Markdown, with diagrams and maths.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://github.com/xykong/homebrew-tap" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/xykong/flux-markdown/releases" >}}

## What it does

FluxMarkdown is a Quick Look extension: selecting a Markdown file in Finder and pressing Space renders it rather than showing raw text. It handles GitHub-flavoured Markdown, code blocks with syntax highlighting, Mermaid diagrams and LaTeX maths.

For a machine whose content directory is entirely Markdown, that turns Finder into a usable way to skim what a file says without opening an editor.

## Notes

- Available from the developer's own tap (`xykong/tap`), not homebrew-cask.
- The extension has to be enabled once in **System Settings → Login Items & Extensions → Quick Look**.
- It renders the file as written. Hugo shortcodes like `{{</* cards */>}}` will appear as literal text, because nothing outside Hugo knows what they mean.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [QLMarkdown](https://github.com/sbarex/QLMarkdown) | Open source | The best-known Quick Look Markdown plugin |
| [Marked 2](https://marked2app.com/) | Paid | A live previewer alongside your editor rather than in Finder |
| [Peek](https://github.com/objective-see/Peek) | Open source | A general-purpose Quick Look extension pack |
| Any editor with preview | — | VS Code, Obsidian or Typora, if Finder is not where you read |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew tap xykong/tap
brew install --cask xykong/tap/flux-markdown
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/xykong/flux-markdown/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/xykong/flux-markdown" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/xykong/flux-markdown" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
