---
title: "Visual Studio Code"
weight: 1
description: "Primary code editor, extension-driven."
---

{{< lead >}}Microsoft's open-source editor: a plain text editor that becomes an IDE through extensions.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/visual-studio-code" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://code.visualstudio.com/Download" >}}

## What it does

VS Code is an Electron-based editor that sits between a plain text editor and a full IDE. Out of the box it gives syntax highlighting, fuzzy file navigation, integrated terminal, Git gutter and staging UI, and a debugger protocol (DAP) that language extensions plug into.

Most of its capability arrives through extensions rather than the core app — language servers for Go, Python, Swift or Hugo templates, linters, formatters, remote development over SSH, and dev container support that reuses the same `.devcontainer/` definition Docker uses.

## Why it is usually the first install

It is the lowest-commitment editor that scales: good enough to open a single file in, capable enough to stay in for a full project, and with an extension for practically every language and framework. Workspace settings, snippets and recommended extensions live in a `.vscode/` directory inside the project, so a repository can carry its own editor configuration for anyone who clones it.

## Notes

The `code` command on `PATH` comes from the app itself — run **Shell Command: Install 'code' command in PATH** from the command palette after a fresh install.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Cursor](https://cursor.com/) and [Windsurf](https://windsurf.com/) | Freemium | VS Code forks built around AI editing |
| [Zed](https://zed.dev/) | Freemium | Native, extremely fast, with collaboration built in |
| [Sublime Text](https://www.sublimetext.com/) | Paid | Instant startup, a one-off licence, far fewer extensions |
| [JetBrains IDEs](https://www.jetbrains.com/ides/) | Paid | Deeper language intelligence, at the cost of weight and price |
| [Neovim](https://neovim.io/) | Open source | The terminal answer, with LSP and tree-sitter |
| [VSCodium](https://vscodium.com/) | Open source | The same editor built without Microsoft's telemetry and branding |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask visual-studio-code
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://code.visualstudio.com/Download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://code.visualstudio.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/visual-studio-code" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/microsoft/vscode" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://code.visualstudio.com/docs" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
