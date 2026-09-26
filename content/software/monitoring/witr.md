---
title: "witr"
weight: 10
description: "Explain what a running process actually is."
---

{{< lead >}}"Why is this running?" — looks up an unfamiliar process and tells you what it belongs to.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/witr" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://github.com/pranshuparmar/witr/releases" >}}

## What it does

Activity Monitor is full of processes with names that explain nothing. witr takes a process name or PID and reports what it is, which package or application owns it, and whether it is an Apple system component or something installed.

```shell
witr mdworker_shared
witr 4821
```

## Why that helps

It shortens the loop between "an unknown process is using 40% CPU" and knowing whether it is a system indexer doing its job, a Homebrew service, or something that should not be there at all. For the last case, [KnockKnock](/software/security/knockknock/) answers the follow-up question of what installed it persistently.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Activity Monitor](https://support.apple.com/guide/activity-monitor/welcome/mac) | Built in | Select a process and inspect it |
| [Sloth](https://sveinbjorn.org/sloth) | Open source | A free GUI over `lsof`, showing what a process has open |
| `ps`, `lsof` and `launchctl list` | Built in | The underlying answers, if you know what to ask |
| [KnockKnock](/software/security/knockknock/) | Open source | For the narrower question of what installed a process persistently |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install witr
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Releases on GitHub](https://github.com/pranshuparmar/witr/releases)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/pranshuparmar/witr" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/witr" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/pranshuparmar/witr" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
