---
title: "fastfetch"
weight: 20
description: "System information summary, fast."
---

{{< lead >}}The neofetch-style system summary, rewritten in C so it runs in milliseconds.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/fastfetch" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/fastfetch-cli/fastfetch/releases" >}}

## What it does

fastfetch prints host, OS, kernel, uptime, packages, shell, resolution, DE/WM, terminal, CPU, GPU, memory and disk beside an ASCII or image logo. Because it is C rather than a shell script, it finishes fast enough to sit in a shell startup file.

```shell
fastfetch
fastfetch --config examples/13    # a bundled preset
fastfetch --logo none -s OS:CPU:Memory:Disk
```

## Notes

Configuration is JSONC at `~/.config/fastfetch/config.jsonc`, and `--gen-config` writes a commented starting point. It replaced neofetch, which is archived and unmaintained.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [neofetch](https://github.com/dylanaraps/neofetch) | Open source | The original; archived and unmaintained since 2024 |
| [macchina](https://github.com/Macchina-CLI/macchina) | Open source | Rust, fast, a more compact default layout |
| [hyfetch](https://github.com/hykilpikonna/hyfetch) | Open source | Fastfetch with pride-flag colour schemes |
| [onefetch](https://onefetch.dev/) | Open source | The same idea pointed at a Git repository instead of a machine |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install fastfetch
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Binaries on GitHub Releases](https://github.com/fastfetch-cli/fastfetch/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/fastfetch-cli/fastfetch" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/fastfetch" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/fastfetch-cli/fastfetch" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
