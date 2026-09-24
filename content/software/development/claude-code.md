---
title: "Claude Code"
weight: 4
description: "Terminal-based AI coding agent."
---

{{< lead >}}Claude as a command-line agent that reads, edits and runs code in a real working tree.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/claude-code" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://claude.com/product/claude-code" >}}

## What it does

Claude Code runs in the terminal and operates on the repository in front of it: reading files, editing them, running tests and build commands, and driving `git` and `gh`. It is the same model as the desktop app with a different surface — a shell session instead of a chat window.

Project behaviour is configured by a `CLAUDE.md` at the repository root, so a project's own conventions — branching rules, build commands, traps to avoid — apply automatically instead of being re-explained every session.

## Notes

- The Homebrew cask installs a self-updating binary; `claude update` also works.
- Skills and plugins live under `~/.claude/`, so they follow the user rather than the repository.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Codex CLI](https://github.com/openai/codex) and [Gemini CLI](https://github.com/google-gemini/gemini-cli) | Free | The same terminal-agent shape from OpenAI and Google |
| [Aider](https://aider.chat/) | Open source | Model-agnostic, Git-commit-centric |
| [Cursor](https://cursor.com/) or [Windsurf](https://windsurf.com/) | Freemium | The editor-shaped version of the same idea |
| [GitHub Copilot CLI](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli) | Freemium | Narrower, focused on shell commands and Git |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask claude-code
```

{{< /tab >}}
{{< tab name="npm" >}}

```shell
npm install -g @anthropic-ai/claude-code
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Installer and docs](https://claude.com/product/claude-code)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://claude.com/product/claude-code" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/claude-code" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://docs.claude.com/en/docs/claude-code/overview" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
