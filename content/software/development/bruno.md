---
title: "Bruno"
weight: 5
description: "Offline, file-based API client — GUI and CLI."
---

{{< lead >}}An API client that stores collections as plain files in your repository instead of in someone's cloud.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/bruno" >}} {{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/bruno-cli" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.usebruno.com/downloads" >}}

## What it does

Bruno is a Postman-style client for HTTP APIs, with one structural difference: a collection is a directory of `.bru` text files on disk. That makes requests reviewable in a pull request, mergeable, and versioned alongside the code they exercise.

There is no account and no mandatory sync. Environments and secrets are files too, so secrets stay out of the collection by convention (`.env`, or a gitignored environment file).

## The CLI

`bruno-cli` runs the same collections headlessly — the normal way to put API checks in CI:

```shell
bru run --env staging --reporter-json results.json
```

## Notes

The GUI cask and the CLI formula are versioned separately and can drift; keep them close when using `.bru` features added recently.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Postman](https://www.postman.com/) | Freemium | The market standard, but account-bound and increasingly cloud-first |
| [Insomnia](https://insomnia.rest/) | Freemium | Lighter than Postman, now also account-gated |
| [Hoppscotch](https://hoppscotch.io/) and [Yaak](https://yaak.app/) | Open source / Freemium | Bruno's file-based instincts |
| `.http` files in VS Code or JetBrains | — | No separate app at all |
| [curl](https://curl.se/) or [HTTPie](https://httpie.io/) | Open source | For anything that does not need to be saved |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask bruno   # GUI
brew install bruno-cli      # CLI
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.usebruno.com/downloads)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.usebruno.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/bruno" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://formulae.brew.sh/formula/bruno-cli" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/usebruno/bruno" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
