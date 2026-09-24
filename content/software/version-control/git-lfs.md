---
title: "Git LFS"
weight: 4
description: "Git extension for versioning large files."
---

{{< lead >}}Keeps big binaries out of the repository history and stores pointers instead.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/git-lfs" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/git-lfs/git-lfs/releases" >}}

## What it does

Git stores every version of every file forever, which makes a repository containing video, RAW photos or disk images unusable within months. LFS replaces tracked binaries with small text pointers; the real objects live on a separate LFS endpoint and are fetched on checkout.

```shell
git lfs install                 # one-time, per machine
git lfs track "*.mp4" "*.braw"
git add .gitattributes
git lfs ls-files
```

## Notes

- Tracking must be set up **before** committing the file; converting existing history needs `git lfs migrate` (a history rewrite).
- GitHub's LFS storage and bandwidth are metered separately from repository size, and bandwidth is the quota people actually hit.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [git-annex](https://git-annex.branchable.com/) | Open source | More flexible, considerably harder to learn |
| [DVC](https://dvc.org/) | Open source | Built for datasets and ML pipelines rather than assets |
| [Perforce Helix](https://www.perforce.com/products/helix-core) | Paid | What studios use when binaries are the majority of the repository |
| Keeping binaries out of Git entirely | — | Object storage plus a manifest, and often the right call |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install git-lfs
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Binaries on GitHub Releases](https://github.com/git-lfs/git-lfs/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://git-lfs.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/git-lfs" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/git-lfs/git-lfs" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/git-lfs/git-lfs/tree/main/docs" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
