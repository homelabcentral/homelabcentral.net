---
title: "git-filter-repo"
weight: 5
description: "Rewrite Git history quickly and correctly."
---

{{< lead >}}The supported way to remove a file, a secret or a path from every commit in a repository.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/git-filter-repo" >}}

## What it does

git-filter-repo rewrites history: drop a path from all commits, extract a subdirectory into its own repository, rewrite author emails, strip files over a size threshold, or scrub a leaked credential.

```shell
git filter-repo --path secrets.env --invert-paths
git filter-repo --strip-blobs-bigger-than 10M
git filter-repo --subdirectory-filter docs
git filter-repo --email-callback 'return b"new@example.com"'
```

It is the tool Git's own documentation now recommends in place of `git filter-branch`, which was orders of magnitude slower and easy to get subtly wrong.

{{< callout type="warning" >}}
This rewrites every commit hash from the filter point onward. Every clone becomes incompatible and must be re-cloned, and the rewrite has to be force-pushed — which a protected branch will refuse. Run it on a fresh clone, and for a leaked secret treat the credential as compromised and rotate it: rewriting history does not un-publish what was already fetched or cached.
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) | Open source | Faster for the narrow cases it covers, Java-based |
| `git filter-branch` | — | Deprecated, orders of magnitude slower and easy to get wrong |
| Starting a fresh repository | — | Sometimes genuinely cheaper than rewriting a decade of history |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install git-filter-repo
```

{{< /tab >}}
{{< tab name="pip" >}}

```shell
pipx install git-filter-repo
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/newren/git-filter-repo" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/git-filter-repo" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/newren/git-filter-repo" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://htmlpreview.github.io/?https://github.com/newren/git-filter-repo/blob/docs/html/git-filter-repo.html" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
