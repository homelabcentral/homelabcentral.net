---
title: "Visual Studio Code"
weight: 1
description: "Primary code editor, extension-driven."
---

{{< lead >}}Microsoft's open-source editor: a plain text editor that becomes an IDE through extensions.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/visual-studio-code" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://code.visualstudio.com/Download" >}}

## What it does

VS Code is an Electron-based editor that sits between a plain text editor and a full IDE. Out of the box it gives syntax highlighting, fuzzy file navigation, integrated terminal, Git gutter and staging UI, and a debugger protocol (DAP) that language extensions plug into. What it is not is a full JetBrains IDE — the deep refactoring and static analysis those ship with come from extensions here, if at all.

Two remote features matter more than the editing. **Dev containers** put the whole environment inside Docker, so the toolchain is defined by the repository rather than by the machine. **Remote - SSH** runs the editor's backend on another host and leaves only the UI local, which is how a laptop edits on a machine with far more compute — over [Tailscale](/software/networking/tailscale/), from anywhere. The two combine: a dev container on the remote host works exactly as it does locally.

Most of its capability arrives through extensions rather than the core app — language servers for Go, Python, Swift or Hugo templates, linters, formatters, remote development over SSH, and dev container support that reuses the same `.devcontainer/` definition Docker uses.

## Why it is usually the first install

It is the lowest-commitment editor that scales: good enough to open a single file in, capable enough to stay in for a full project, and with an extension for practically every language and framework. Workspace settings, snippets and recommended extensions live in a `.vscode/` directory inside the project, so a repository can carry its own editor configuration for anyone who clones it.

## Configuration

Everything is a JSON file, at one of several scopes. User settings apply everywhere; workspace settings live in `.vscode/settings.json` inside the project and override them; a dev container adds its own on top. The same split applies to snippets — global ones sit in the user profile, project ones in `.vscode/*.code-snippets`, which is how a repository ships boilerplate to everyone who clones it.

**Settings Sync** carries settings, keybindings, snippets, themes and the extension list between machines through a GitHub or Microsoft account. It is off until turned on, from the gear menu.

Themes are extensions like any other and sync with the rest — One Dark Pro's Monokai Darker variant is a reasonable place to start. Extensions can also be pinned per environment: `devcontainer.json` lists the ones its container installs, so a container is reproducible without touching the local profile.

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
