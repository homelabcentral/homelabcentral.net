---
title: "Bun"
weight: 2
description: "JavaScript runtime, bundler, transpiler and package manager."
---

{{< lead >}}One binary that replaces Node, npm, a bundler and a test runner.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://github.com/oven-sh/homebrew-bun" >}}

## What it does

Bun is a JavaScript and TypeScript runtime built on JavaScriptCore rather than V8. It bundles a package manager (`bun install`), a bundler (`bun build`), a test runner (`bun test`) and a script runner, and it runs TypeScript and JSX directly with no build step.

Its main practical draw is install speed — a cold `bun install` is typically several times faster than npm — and that a project needs one tool instead of four.

## Notes

Available from the vendor tap (`oven-sh/bun`), not homebrew-core, so `brew tap` comes first. Node compatibility is good but not total; anything reaching deep into Node internals or native addons is worth testing before committing to it.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Node.js](https://nodejs.org/) with [pnpm](https://pnpm.io/) | Open source | The conservative choice, and what most CI expects |
| [Deno](https://deno.com/) | Open source | Secure by default, TypeScript-native, its own standard library |
| [Yarn](https://yarnpkg.com/) or [npm](https://www.npmjs.com/) | Open source | Package management only, on top of Node |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew tap oven-sh/bun
brew install oven-sh/bun/bun
```

{{< /tab >}}
{{< tab name="Install script" >}}

```shell
curl -fsSL https://bun.sh/install | bash
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://bun.sh/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/oven-sh/bun" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://bun.sh/docs" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
