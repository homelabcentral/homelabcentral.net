---
title: "actionlint"
weight: 11
description: "Static checker for GitHub Actions workflow files."
---

{{< lead >}}Catches broken workflow YAML before a push burns a CI minute proving it.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/actionlint" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/rhysd/actionlint/releases" >}}

## What it does

`actionlint` type-checks workflow files: unknown `runs-on` labels, invalid `${{ }}` expressions and undefined contexts, misspelled event names, `needs:` referring to nonexistent jobs, action inputs that do not exist, and shell scripts inside `run:` blocks (it shells out to ShellCheck and pyflakes when present).

```shell
actionlint                        # every workflow in the repo
actionlint .github/workflows/pages.yml
```

## Why linting workflows is not optional

Workflow files fail in ways that do not look like failures. A required status check on a protected branch is matched **by job name**, so renaming a job silently detaches the protection rule rather than erroring. A typo in an `if:` expression evaluates to false and skips a step quietly. Neither shows up until something that should have been blocked goes through.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [zizmor](https://docs.zizmor.sh/) | Open source | Audits the same files for security problems rather than correctness |
| [yamllint](https://github.com/adrienverge/yamllint) | Open source | Catches malformed YAML, but knows nothing about Actions schemas |
| GitHub's web editor | — | Validates as you type, but only one file at a time |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install actionlint
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Binaries on GitHub Releases](https://github.com/rhysd/actionlint/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://rhysd.github.io/actionlint/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/actionlint" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/rhysd/actionlint" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/rhysd/actionlint/blob/main/docs/checks.md" title="Documentation" icon="book-open" subtitle="Every check it performs" >}}
{{< /cards >}}
