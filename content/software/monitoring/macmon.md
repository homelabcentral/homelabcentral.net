---
title: "macmon"
weight: 4
description: "Sudoless performance and power monitoring for Apple Silicon."
---

{{< lead >}}A terminal dashboard of CPU, GPU and ANE power draw, frequencies and temperatures — with no admin rights.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/macmon" >}}

## What it does

macmon reads Apple Silicon's own power metrics: package, CPU, GPU and Neural Engine wattage, per-cluster frequencies for efficiency and performance cores, memory bandwidth, temperatures and throttling state. It renders them as a live TUI.

The "sudoless" part is the selling point — `powermetrics` requires root, which makes it awkward to leave running. macmon does not.

```shell
macmon
macmon pipe --soc-info      # machine-readable output
```

## Notes

Apple Silicon only; there is nothing equivalent to read on Intel Macs. Useful for exactly the question a laptop inference host raises: how much power a local LLM run actually costs, and whether the machine is thermally throttling during it.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| `sudo powermetrics` | Built in | Apple's own, the data source, but needs root |
| [asitop](https://github.com/tlkh/asitop) | Open source | A Python TUI over `powermetrics`, same idea, also needs root |
| [Mx Power Gadget](/software/monitoring/mx-power-gadget/) | Paid | The graphical version, paid, menu bar resident |
| [Stats](https://github.com/exelban/stats) | Open source | Menu bar monitoring, less detail on power domains |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install macmon
```

{{< /tab >}}
{{< tab name="cargo" >}}

```shell
cargo install macmon
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/vladkens/macmon" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/macmon" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/vladkens/macmon" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
