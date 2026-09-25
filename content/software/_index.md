---
title: Software
linkTitle: Software
weight: 2
description: "macOS software by category, with what each tool does and how to install it."
sidebar:
  open: false
# Hextra's docs layouts are selected by page TYPE, not by being a sibling of
# content/docs. Without this, everything under content/software/ falls through
# to layouts/single.html and layouts/list.html, which pass disableSidebar to the
# sidebar partial and skip breadcrumbs, the context menu, the last-updated row
# and the prev/next pager. The cascade puts the whole section on docs/single.html
# and docs/list.html instead.
cascade:
  type: docs
---

{{< lead >}}
macOS software worth installing — 166 tools across 17 categories.
{{< /lead >}}

## Before anything else

{{% steps %}}

### Xcode Command Line Tools

```shell
xcode-select --install
```

A compiler, `git` and the headers Homebrew builds against. The full [Xcode](/software/development/xcode/) install is only needed for building apps.

### Homebrew

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then follow the instructions it prints to put `brew` on `PATH` — on Apple Silicon, `eval "$(/opt/homebrew/bin/brew shellenv)"` in your shell profile.

{{% /steps %}}

A set of Homebrew choices can be captured and replayed on the next machine:

```shell
brew bundle dump --describe    # write a Brewfile from what is installed
brew bundle install            # install everything a Brewfile lists
```

## Categories

{{< cards cols="3" >}}
{{< card link="development" title="Development & Coding" icon="code" subtitle="Editors, AI coding agents, and the clients that sit open beside them." tag="11" tagColor="gray" >}}
{{< card link="toolchains" title="Languages, Runtimes & Build Tools" icon="cube" subtitle="Language toolchains, package managers, containers and the tools that build and check a project." tag="11" tagColor="gray" >}}
{{< card link="terminal" title="Terminal & Shell" icon="terminal" subtitle="The terminal emulator, the shell around it, and the replacements for the stock Unix tools." tag="24" tagColor="gray" >}}
{{< card link="version-control" title="Version Control" icon="github" subtitle="Git itself, plus the CLI, TUI and surgery tools around it." tag="5" tagColor="gray" >}}
{{< card link="ai" title="AI & Local Models" icon="cube-transparent" subtitle="Local model runners and on-device speech tools." tag="3" tagColor="gray" >}}
{{< card link="media" title="Media & Video" icon="film" subtitle="Editing, screen capture and recording, transcoding, downloading and playback." tag="20" tagColor="gray" >}}
{{< card link="design" title="Design & Graphics" icon="color-swatch" subtitle="Vector editing, image optimisation and colour picking." tag="4" tagColor="gray" >}}
{{< card link="browsers" title="Browsers & Web" icon="globe-alt" subtitle="Three browsers, a content blocker, and a crawler for auditing sites." tag="5" tagColor="gray" >}}
{{< card link="networking" title="Networking & Remote Access" icon="status-online" subtitle="VPNs, mesh networking, remote desktops, file transfer, torrents and cable diagnostics." tag="15" tagColor="gray" >}}
{{< card link="virtualization" title="Virtualization & Emulation" icon="server" subtitle="Virtual machines, installer media, and emulating other architectures and consoles." tag="11" tagColor="gray" >}}
{{< card link="monitoring" title="System Monitoring & Hardware" icon="chart-bar" subtitle="Menu bar stats, process viewers, power and thermal monitoring, disk benchmarks and display control." tag="10" tagColor="gray" >}}
{{< card link="maintenance" title="Disk, Cleanup & Maintenance" icon="trash" subtitle="Finding what filled the disk, uninstalling properly, and making installer media." tag="11" tagColor="gray" >}}
{{< card link="files" title="Files, Archives & Filesystems" icon="archive" subtitle="Archivers, compression tools, NTFS support and cloud sync." tag="8" tagColor="gray" >}}
{{< card link="input" title="Input, Window & Menu Bar" icon="template" subtitle="Keyboard remapping, mouse behaviour, menu bar control and keep-awake." tag="7" tagColor="gray" >}}
{{< card link="security" title="Security & Privacy" icon="shield-check" subtitle="Password managers, the system keychain, and persistence auditing." tag="3" tagColor="gray" >}}
{{< card link="productivity" title="Productivity & Documents" icon="document-text" subtitle="PDFs, Markdown, chat, Shortcuts actions and package management from the command line." tag="7" tagColor="gray" >}}
{{< card link="fonts" title="Fonts" icon="translate" subtitle="Monospaced coding fonts, mostly Nerd Font patched." tag="11" tagColor="gray" >}}
{{< /cards >}}
