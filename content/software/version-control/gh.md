---
title: "GitHub CLI"
weight: 2
description: "GitHub from the command line — PRs, issues, runs, releases."
---

{{< lead >}}Pull requests, checks and Actions runs without opening a browser.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/gh" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/cli/cli/releases" >}}

## What it does

`gh` wraps the GitHub API in task-shaped commands: open and review pull requests, watch check runs, list and rerun workflow runs, manage releases, and `gh api` for anything without a dedicated subcommand.

```shell
gh pr create --fill
gh pr checks --watch
gh run list --branch main --limit 5
gh api repos/:owner/:repo/rulesets
```

## Why it matters

Once a branch is protected — no direct pushes, a required status check — the only route to shipping is a pull request whose checks passed. `gh` makes that a three-command loop from the terminal instead of a browser round trip, and it is what most `make pr`-style wrappers are built on.

## Notes

`gh auth status` is the first thing to check when a command returns a 404 on a repository that plainly exists: it is almost always authenticated as the wrong account, or as an account without access.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [glab](https://gitlab.com/gitlab-org/cli) | Open source | The same tool for GitLab |
| [tea](https://gitea.com/gitea/tea) | Open source | The same tool for Gitea and Forgejo |
| [GitHub Desktop](https://desktop.github.com/) | Free | The graphical equivalent for the pull request half |
| `git` plus `curl` against the API | — | What `gh` saves you from writing |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install gh
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Installers on GitHub Releases](https://github.com/cli/cli/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://cli.github.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/gh" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/cli/cli" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://cli.github.com/manual/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
