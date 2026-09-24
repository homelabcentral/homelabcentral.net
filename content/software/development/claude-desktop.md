---
title: "Claude"
weight: 3
description: "Anthropic's desktop client for Claude."
---

{{< lead >}}Anthropic's Claude in a native window, with MCP servers and local file access.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/claude" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://claude.com/download" >}}

## What it does

The desktop app wraps Claude with things a browser tab cannot do: connecting to [MCP](https://modelcontextprotocol.io/) servers running locally, reading and writing files you grant it access to, and staying resident behind a global shortcut.

For a homelab that matters mostly for MCP — a local server can expose a database, a filesystem path, a Git repository or a home-automation API to Claude as tools, without any of it leaving the machine except the text of the request.

## Notes

The app auto-updates itself, so Homebrew reports a version that lags the running build. That is expected for `auto_updates` casks and not a broken install.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [ChatGPT](https://chatgpt.com/) and [Gemini](https://gemini.google.com/) desktop apps | Free | The same shape from other vendors |
| claude.ai in a browser | Freemium | Everything except MCP servers and local file access |
| [LM Studio](https://lmstudio.ai/) or [Jan](https://jan.ai/) | Free | The same chat window against a model on your own machine |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask claude
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://claude.com/download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://claude.com/download" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/claude" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://modelcontextprotocol.io/" title="Documentation" icon="book-open" subtitle="Model Context Protocol" >}}
{{< /cards >}}
