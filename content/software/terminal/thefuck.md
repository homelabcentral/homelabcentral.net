---
title: "thefuck"
weight: 8
description: "Corrects the previous mistyped command."
---

{{< lead >}}Run it after a failed command and it proposes the fixed version for you to confirm.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/thefuck" >}}

## What it does

thefuck inspects the last command and its error output, matches it against a library of rules — missing `sudo`, a typo'd subcommand, `git brnch`, a forgotten `-p` on `mkdir`, the wrong package manager — and prints the corrected command. Enter runs it.

```shell
$ git brnch
git: 'brnch' is not a git command.
$ fuck
git branch [enter/↑/↓/ctrl+c]
```

## Notes

- Requires a shell alias: `eval "$(thefuck --alias)"`, optionally renamed (`thefuck --alias fix`).
- Written in Python, so it carries a Python dependency and adds noticeable startup latency to the alias.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [pay-respects](https://codeberg.org/iff/pay-respects) | Open source | A Rust rewrite, much faster to start |
| `sudo !!` | Built in | The built-in answer to the most common case |
| Shell aliases for your own typos | — | Zero latency, and it fixes them permanently |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install thefuck
```

{{< /tab >}}
{{< tab name="pip" >}}

```shell
pip3 install thefuck --user
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/nvbn/thefuck" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/thefuck" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/nvbn/thefuck" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
