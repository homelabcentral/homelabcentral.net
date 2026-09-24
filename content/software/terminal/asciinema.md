---
title: "asciinema"
weight: 16
description: "Record and replay terminal sessions as text."
---

{{< lead >}}Records a terminal session into a small text file that replays as real, selectable text.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/asciinema" >}}

## What it does

asciinema records stdin/stdout timing into a `.cast` file — JSON, not video. Playback is a real terminal replay: text can be selected and copied, the file is a few kilobytes instead of megabytes, and it diffs.

```shell
asciinema rec demo.cast
asciinema play demo.cast
asciinema play -s 2 -i 0.5 demo.cast   # 2x speed, cap idle at 0.5s
asciinema upload demo.cast
```

## Embedding

Casts can be self-hosted with the `asciinema-player` JavaScript component, or uploaded to asciinema.org. For documentation, a cast beats a GIF: smaller, copyable, and readable at any zoom level.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [VHS](https://github.com/charmbracelet/vhs) | Open source | Charm's tool: scripted, deterministic recordings that produce GIFs |
| [t-rec](https://github.com/sassman/t-rec-rs) and [terminalizer](https://github.com/faressoft/terminalizer) | Open source | Record to GIF directly, larger files |
| [Gifski](https://gif.ski/) plus a screen recording | Open source | The brute-force route, and it looks fine |
| `script(1)` | Built in | Captures the text without timing, already installed |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install asciinema
```

{{< /tab >}}
{{< tab name="pip" >}}

```shell
pipx install asciinema
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://asciinema.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/asciinema" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/asciinema/asciinema" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://docs.asciinema.org/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
