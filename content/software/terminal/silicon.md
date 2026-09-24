---
title: "silicon"
weight: 17
description: "Render a source file to a PNG image."
---

{{< lead >}}Turns code into a shareable image without a screenshot or a browser.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/silicon" >}}

## What it does

silicon takes a file or piped text and renders a highlighted code image — window frame, rounded corners, drop shadow, optional line numbers — straight to PNG or the clipboard. No browser, no screenshot cropping.

```shell
silicon hugo.yaml -o hugo.png
silicon --from-clipboard --to-clipboard -l yaml
silicon main.go -o out.png --theme Dracula --no-window-controls
```

## Notes

Fonts are resolved from the system, set with `--font 'JetBrains Mono=16'`. `--list-themes` shows the bundled Sublime-compatible themes. For terminal *output* rather than source code, `freeze` is the better fit.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [freeze](/software/terminal/freeze/) | Open source | Also local, also fast, and it understands ANSI terminal output |
| [carbon.now.sh](https://carbon.now.sh/) and [ray.so](https://ray.so/) | Free | Web-based, the prettiest defaults |
| [CodeSnap](https://marketplace.visualstudio.com/items?itemName=adpyke.codesnap) | Open source | A VS Code extension, so the theme matches your editor |
| A cropped screenshot | — | Nobody will notice |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install silicon
```

{{< /tab >}}
{{< tab name="cargo" >}}

```shell
cargo install silicon
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/Aloxaf/silicon" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/silicon" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/Aloxaf/silicon" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
