---
title: "DBX"
weight: 7
description: "Open source database client for 90+ engines, with an AI assistant and an MCP server."
---

{{< lead >}}One small Rust binary that connects to almost anything, and hands the same connections to a coding agent over MCP.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/dbx" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://dbxio.com/" >}}

## What it does

DBX is a database client: browse schemas, edit rows in a grid, write SQL in a CodeMirror editor with metadata-aware autocomplete, and run it against 90+ engines — the usual SQL ones, plus Redis, MongoDB, DuckDB, ClickHouse, the vector stores, and message queues like Kafka and Pulsar. Deeper tools come with it: ER diagrams, schema diff, explain plans, column-level lineage, cross-engine data transfer, and connection import from DBeaver or Navicat.

It is built with Rust and Tauri rather than Java or Electron, so there is no JRE to install and no bundled Chromium, and the download is tens of megabytes rather than hundreds.

Two things set it apart from the rest of the field. An AI assistant writes, explains and fixes SQL in place, against Claude, OpenAI, or a local model through Ollama. And a separate MCP server exposes your saved connections to Claude Code, Cursor and other agents, with a per-connection allowlist and read-only, safe-write or full-access modes.

For a homelab the Docker build matters as much as the desktop app: the same client runs as a self-hosted web service on port 4224, so a browser on any machine reaches the databases without a client installed.

## Notes

Credentials are encrypted before they are written, using the macOS Keychain on the desktop and a key in the data directory for Docker — back that key up alongside the database file.

The MCP server and the CLI are published separately, so installing the app does not install either: `npx @dbx-app/mcp-server` and `npm install -g @dbx-app/cli` (or `brew tap t8y2/tap && brew install dbx-cli`).

The app updates itself, so Homebrew's recorded version lags the installed one.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [TablePro](/software/development/tablepro/) | Freemium | Native to macOS, and macOS only |
| [DBeaver](https://dbeaver.io/) | Open source | The widest engine support of any of them, on a Java runtime |
| [TablePlus](https://tableplus.com/) | Freemium | Fewer engines, licensed per device |
| [DataGrip](https://www.jetbrains.com/datagrip/) | Paid | The strongest SQL editor, at JetBrains' weight |
| [Navicat](https://www.navicat.com/) | Paid | The incumbent this is priced against |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask dbx
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://dbxio.com/)

Separate builds for Apple Silicon and Intel.

{{< /tab >}}
{{< tab name="Docker" >}}

```shell
docker run -d --pull=always --name dbx -p 4224:4224 \
  -v dbx-data:/app/data \
  t8y2/dbx:latest
```

Then open `http://localhost:4224`. Multi-arch images, amd64 and arm64.

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://dbxio.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/t8y2/dbx" title="GitHub" icon="github" subtitle="Source, Apache-2.0" >}}
{{< card link="https://formulae.brew.sh/cask/dbx" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
