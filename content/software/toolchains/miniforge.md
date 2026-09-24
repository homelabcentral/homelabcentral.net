---
title: "Miniforge"
weight: 5
description: "Minimal conda installer defaulting to conda-forge."
---

{{< lead >}}A small conda distribution that pulls packages from conda-forge instead of Anaconda's channel.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/miniforge" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/conda-forge/miniforge/releases" >}}

## What it does

Miniforge is Miniconda with the defaults swapped: `conda-forge` is the only configured channel, and `mamba` (the fast C++ solver) is available alongside `conda`. That avoids Anaconda Inc.'s commercial licensing terms on the `defaults` channel entirely.

It exists for the Python work where `pip` is not enough — scientific stacks, anything with compiled dependencies, CUDA or MLX builds, or a project that needs a specific Python version isolated from the system one.

## Notes

The installer edits your shell profile to add a `conda init` block. `conda config --set auto_activate_base false` keeps it from hijacking every new shell.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [uv](https://docs.astral.sh/uv/) | Open source | Far faster, and the direction most Python projects are moving |
| [micromamba](https://mamba.readthedocs.io/) | Open source | A single binary with the same conda-forge solver |
| [Miniconda](https://www.anaconda.com/docs/getting-started/miniconda/main) | Free | The same installer, pointed at Anaconda's channel and its licence terms |
| [pixi](https://pixi.sh/) | Open source | Project-scoped conda environments with a lockfile |
| pyenv plus venv | Open source | No conda at all, if nothing needs compiled scientific packages |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask miniforge
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Installers on GitHub Releases](https://github.com/conda-forge/miniforge/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/conda-forge/miniforge" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/miniforge" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://conda-forge.org/docs/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
