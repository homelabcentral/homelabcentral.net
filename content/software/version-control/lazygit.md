---
title: "lazygit"
weight: 3
description: "Terminal UI for Git."
---

{{< lead >}}The Git operations that are genuinely better with a UI — staging hunks, interactive rebase, resolving conflicts.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/lazygit" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://github.com/jesseduffield/lazygit/releases" >}}

## What it does

lazygit is a full-screen TUI over a real repository: panels for status, files, branches, commits, stash and the diff. Where it earns its place is the fiddly work — staging individual hunks or single lines with a keypress, reordering and squashing commits in an interactive rebase by moving a cursor, and resolving conflicts side by side.

```shell
lazygit          # in any repository
# space stage · c commit · P push · R refresh · x show keybindings
```

## Notes

It calls the `git` binary rather than reimplementing anything, so the repository state is always something plain Git commands can also reason about. Config lives at `~/Library/Application Support/lazygit/config.yml` on macOS.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [tig](https://jonas.github.io/tig/) | Open source | Lighter, focused on browsing history rather than performing operations |
| [gitui](https://github.com/gitui-org/gitui) | Open source | Rust, faster to start, a similar layout |
| [Sublime Merge](https://www.sublimemerge.com/) and [Fork](https://git-fork.com/) | Paid | GUIs, and the nicest diff viewers available |
| [GitHub Desktop](https://desktop.github.com/) | Free | Simple, and enough for commit-and-push |
| [magit](https://magit.vc/) or [vim-fugitive](https://github.com/tpope/vim-fugitive) | Open source | The same power, inside Emacs or Vim |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install lazygit
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Binaries on GitHub Releases](https://github.com/jesseduffield/lazygit/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/jesseduffield/lazygit" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/lazygit" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/jesseduffield/lazygit" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
