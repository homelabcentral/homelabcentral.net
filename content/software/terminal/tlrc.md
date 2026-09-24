---
title: "tlrc (tldr)"
weight: 14
description: "Official tldr-pages client, written in Rust."
---

{{< lead >}}Man pages replaced by six examples of what people actually type.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/tlrc" >}}

## What it does

`tldr` shows a short, community-maintained page of practical examples for a command instead of its full manual. tlrc is the official Rust client: it caches the pages locally, so lookups are instant and work offline.

```shell
tldr tar
tldr --update          # refresh the cache
tldr --platform osx dd # platform-specific page
```

## Notes

Pages come from the [tldr-pages](https://github.com/tldr-pages/tldr) repository. It complements `man` rather than replacing it — tldr for "how do I invoke this", `man` for what a flag actually means.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [tealdeer](https://github.com/tealdeer-rs/tealdeer) | Open source | The other Rust tldr client, and the more widely installed one |
| `tldr` (the Node client) | Open source | The reference implementation |
| [cheat.sh](https://cheat.sh/) | Free | `curl cheat.sh/tar`, no install at all |
| [navi](https://github.com/denisidoro/navi) | Open source | Interactive cheat sheets you can execute rather than read |
| `man` | Built in | Complete, authoritative, and no help whatsoever when you are in a hurry |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install tlrc
```

{{< /tab >}}
{{< tab name="cargo" >}}

```shell
cargo install tlrc
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://tldr.sh/tlrc/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/tlrc" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/tldr-pages/tlrc" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
