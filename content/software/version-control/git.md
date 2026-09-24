---
title: "Git"
weight: 1
description: "Distributed version control."
---

{{< lead >}}The version control system everything else on this page is a front end for.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/git" >}}

## What it does

Git tracks content as a directed graph of commits, each a full snapshot addressed by hash. Branching is cheap, history is rewritable before it is shared, and every clone is a complete repository.

## Why install it from Homebrew

macOS ships a Git that comes from the Xcode Command Line Tools — usually a year or more behind, and it disappears or reverts across Xcode updates. The Homebrew build is current and stays where you put it.

```shell
git --version
which -a git    # /opt/homebrew/bin/git should win
```

## Two identities on one machine

Working under more than one GitHub account is where Git quietly does the wrong thing. Two settings fix it:

- `git config user.name` and `user.email` set **per repository**, so commits are attributed correctly without a global default fighting them.
- An SSH host alias in `~/.ssh/config` per account, with the remote written against the alias (`git@github-work:org/repo.git`) so the right key is offered.

Rewriting such a remote back to `git@github.com:` silently selects the default key and the push fails, or worse, succeeds as the wrong user.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Jujutsu](https://jj-vcs.github.io/jj/) (`jj`) | Open source | Git-compatible storage with a much better model for rewriting history |
| [Mercurial](https://www.mercurial-scm.org/) | Open source | Simpler and more consistent; still used at scale inside a few large companies |
| [Fossil](https://fossil-scm.org/) | Open source | Version control, bug tracker and wiki in one file |
| [Perforce](https://www.perforce.com/products/helix-core) or [Subversion](https://subversion.apache.org/) | Paid / Open source | Centralised, and still standard in games and some enterprises |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install git
```

{{< /tab >}}
{{< tab name="Apple" >}}

The Xcode Command Line Tools include an older Git:

```shell
xcode-select --install
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://git-scm.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/git" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://git-scm.com/doc" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< card link="https://git-scm.com/book/en/v2" title="Pro Git book" icon="book-open" subtitle="Free, and still the best reference" >}}
{{< /cards >}}
