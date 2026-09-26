---
title: "tree"
weight: 11
description: "Print a directory as an indented tree."
---

{{< lead >}}The original recursive directory lister — still the fastest way to paste a project layout into a document.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/tree" >}}

## What it does

`tree` walks a directory and prints it as an ASCII tree. Useful flags:

```shell
tree -L 2                 # depth limit
tree -a -I 'node_modules|.git'   # show hidden, ignore patterns
tree -d                   # directories only
tree -H . -o index.html   # HTML output
```

## Notes

Worth keeping even with `lsd --tree` available: `tree`'s output format is stable and scriptable, documentation and READMEs quote `tree -L 2` verbatim, and it needs no special font.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| eza --tree or lsd --tree | Open source | The same view from a tool you may already have |
| [broot](https://dystroy.org/broot/) | Open source | An interactive tree that can navigate and act, not just print |
| `find` | Built in | No tree drawing, but it is everywhere and it composes |
{{< /borderless-table >}}

## Install

```shell
brew install tree
```

## Links

{{< cards cols="2" >}}
{{< card link="https://oldmanprogrammer.net/source.php?dir=projects/tree" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/tree" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< /cards >}}
