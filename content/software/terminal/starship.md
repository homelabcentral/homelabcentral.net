---
title: "Starship"
weight: 4
description: "Cross-shell prompt written in Rust."
---

{{< lead >}}A fast prompt that shows Git state, language versions and context, configured in one TOML file.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/starship" >}}

## What it does

Starship renders the prompt: current directory, Git branch and dirty state, the language version relevant to the directory you are in (Go, Node, Python, Rust), Kubernetes context, command duration, exit status. Modules activate only when relevant, so a plain directory gets a plain prompt.

Configuration is a single `~/.config/starship.toml`, and the same binary works in Zsh, Bash, Fish, Nu and PowerShell.

```shell
# ~/.zshrc
eval "$(starship init zsh)"
```

## Notes

Most presets assume a Nerd Font for the glyphs. `starship explain` breaks down what each segment of the current prompt is and what it cost in milliseconds.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Powerlevel10k](https://github.com/romkatv/powerlevel10k) | Open source | Zsh-only, extremely fast, with a guided configuration wizard |
| [oh-my-posh](https://ohmyposh.dev/) | Open source | The same cross-shell idea, from the PowerShell world |
| [pure](https://github.com/sindresorhus/pure) and [spaceship-prompt](https://spaceship-prompt.sh/) | Open source | Zsh prompts, minimal and maximal respectively |
| A hand-written `PS1` | — | No dependency, and instant |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install starship
```

{{< /tab >}}
{{< tab name="Install script" >}}

```shell
curl -sS https://starship.rs/install.sh | sh
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://starship.rs/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/starship" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/starship/starship" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://starship.rs/config/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
