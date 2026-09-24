---
title: "pam_reattach"
weight: 3
description: "Touch ID for sudo inside tmux and screen."
---

{{< lead >}}Reattaches a PAM session to the GUI session so Touch ID works in a multiplexer.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/pam-reattach" >}}

## What it does

macOS can authenticate `sudo` with Touch ID via `pam_tid.so`, but only from a process attached to the Aqua (GUI) session. Inside tmux or screen that attachment is lost, so Touch ID silently falls back to a password prompt.

`pam_reattach` reattaches the process to the user's GUI session first, restoring Touch ID — and, as a side effect, clipboard access from the same processes.

## Configuration

It must be the **first** line of `/etc/pam.d/sudo_local`, before `pam_tid.so`:

```
auth       optional       /opt/homebrew/lib/pam/pam_reattach.so
auth       sufficient     pam_tid.so
```

`sudo_local` survives OS upgrades; editing `/etc/pam.d/sudo` directly does not.

{{< callout type="warning" >}}
A malformed `/etc/pam.d/sudo*` file can lock you out of `sudo` entirely. Keep a root shell open in another window while editing, and verify with `sudo -k; sudo true` before closing it.
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| `pam_tid.so` alone | Built in | Touch ID for `sudo` already works outside a multiplexer |
| Typing the password | — | The honest alternative; this module exists only to avoid it |
{{< /borderless-table >}}

## Install

```shell
brew install pam-reattach
```

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/fabianishere/pam_reattach" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/pam-reattach" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/fabianishere/pam_reattach" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
