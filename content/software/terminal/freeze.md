---
title: "Freeze"
weight: 18
description: "Generate images of code and terminal output."
---

{{< lead >}}Charm's screenshot tool for code and for ANSI terminal output, including SVG.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://github.com/charmbracelet/homebrew-tap" >}}

## What it does

Freeze renders code or captured terminal output to PNG, SVG or WebP, with window chrome, padding, margins, shadows and themes controlled by flags or a config file. Unlike silicon it understands ANSI escape sequences, so real command output keeps its colours.

```shell
freeze main.go -o code.png
freeze --execute "lsd --tree --depth 2" -o tree.svg
freeze --theme dracula --window --border.radius 8 hugo.yaml
```

## Notes

Available from the `charmbracelet/tap` tap. SVG output is the interesting one for documentation — it stays sharp at any zoom and the text remains real text in the file.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [silicon](/software/terminal/silicon/) | Open source | The same job for source files, no ANSI support |
| [carbon.now.sh](https://carbon.now.sh/) or [ray.so](https://ray.so/) | Free | Web-based, no install |
| [VHS](https://github.com/charmbracelet/vhs) | Open source | Charm's sibling tool, for motion rather than a still frame |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew tap charmbracelet/tap
brew install charmbracelet/tap/freeze
```

{{< /tab >}}
{{< tab name="go install" >}}

```shell
go install github.com/charmbracelet/freeze@latest
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://charm.sh/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/charmbracelet/freeze" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
