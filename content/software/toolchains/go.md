---
title: "Go"
weight: 1
description: "Go compiler and module toolchain."
---

{{< lead >}}The Go toolchain — also the dependency that makes Hugo Modules work.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/go" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://go.dev/dl/" >}}

## What it does

Go compiles statically linked binaries, manages dependencies through modules, and ships its own formatter, test runner and race detector. `go build`, `go test`, `go vet` and `gofmt` cover most of what other ecosystems need separate tools for.

## Where else it shows up

Beyond writing Go, Hugo's module system is Go's module system. `hugo mod get`, `hugo mod vendor` and the `imports` block in `hugo.yaml` all delegate to the Go tool, so a Hugo site that pulls its theme as a module needs Go installed.

## Notes

`GOPATH` defaults to `~/go`, and `go install` drops binaries in `~/go/bin` — add it to `PATH` or those tools appear to vanish.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Rust](https://www.rust-lang.org/) | Open source | The other common choice for single-binary CLI tools and services, with a steeper curve |
| [Zig](https://ziglang.org/) | Open source | Younger, lower-level, aimed at the C replacement niche rather than Go's |
| [Node.js](https://nodejs.org/) or [Python](https://www.python.org/) | Open source | Quicker to write, but they ship a runtime rather than one binary |
| Nothing, for Hugo Modules | — | That path resolves through the Go tool specifically, so it is a hard requirement rather than a choice |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install go
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Official installers](https://go.dev/dl/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://go.dev/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/go" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://go.dev/doc/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< card link="https://github.com/golang/go" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
