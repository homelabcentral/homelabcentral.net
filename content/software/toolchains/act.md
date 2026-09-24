---
title: "act"
weight: 10
description: "Run GitHub Actions workflows locally."
---

{{< lead >}}Runs GitHub Actions workflows in local Docker containers, so a CI fix takes seconds instead of a push.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/act" >}}

## What it does

`act` parses `.github/workflows/`, builds the job graph and runs each job in a container image approximating GitHub's runners. Secrets and variables come from `--secret-file` or the environment.

```shell
act -l                       # list workflows and jobs
act push -j build            # run the 'build' job of the push event
act pull_request --dryrun    # resolve the graph without executing
```

## Caveats worth knowing

The runner images are approximations, not GitHub's. Anything depending on the exact toolchain versions preinstalled on `ubuntu-latest`, on OIDC tokens, or on `macos-*` runners will not reproduce.

{{< callout type="warning" >}}
`act` runs workflows **for real**. A workflow that deploys, force-pushes, publishes a package or posts to an API will do all of those from your machine, with whatever credentials you hand it. Check what a job actually does before running it locally, and reproduce deploy workflows by running their build step directly instead.
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| `gh workflow run` on a scratch branch | — | Slower, but runs on GitHub's real runners |
| [Dagger](https://dagger.io/) | Freemium | Pipelines defined in code that run identically locally and in CI |
| `gitlab-runner exec` | — | The equivalent trick for GitLab CI |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install act
```

{{< /tab >}}
{{< tab name="Install script" >}}

```shell
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://nektosact.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/act" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/nektos/act" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://nektosact.com/usage/index.html" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
