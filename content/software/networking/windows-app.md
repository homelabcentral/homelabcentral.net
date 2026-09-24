---
title: "Windows App"
weight: 4
description: "Microsoft's RDP client — remote Windows desktops and Cloud PCs."
---

{{< lead >}}Remote Desktop into Windows machines, Azure Virtual Desktop and Windows 365.{{< /lead >}}

{{< badge content="Mac App Store" color="purple" icon="shopping-bag" size="lg" link="https://apps.apple.com/us/app/id1295203466" >}}

## What it does

Formerly Microsoft Remote Desktop, Windows App connects to Windows hosts over RDP with multi-monitor support, dynamic resolution, clipboard and drive redirection, audio, and printer passthrough. It also handles Azure Virtual Desktop, Windows 365 Cloud PCs and Microsoft Dev Box from the same list.

For a homelab that means a Windows VM — under UTM locally, or on a box in the rack — is usable as a full desktop rather than through a VM console window.

## Notes

- RDP needs Windows Pro or Enterprise on the host; Home editions cannot accept incoming sessions.
- Do not expose RDP to the internet. Reach it over Tailscale or a VPN instead — port 3389 is among the most aggressively scanned ports there is.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Jump Desktop](https://jumpdesktop.com/) | Paid | Generally the better RDP and VNC client on macOS |
| [FreeRDP](https://www.freerdp.com/) | Open source | Command-line, scriptable |
| [Parallels Desktop](https://www.parallels.com/products/desktop/) | Paid | Runs Windows locally instead of connecting to it |
| [Screen Sharing / VNC](https://support.apple.com/guide/mac-help/mh14066/mac) | Built in | For macOS and Linux hosts rather than Windows |
| [AnyDesk](https://anydesk.com/) or [TeamViewer](https://www.teamviewer.com/) | Freemium | When you cannot reach the host's network at all |
{{< /borderless-table >}}

## Install

[Windows App on the Mac App Store](https://apps.apple.com/us/app/id1295203466)

Or with `mas`:

```shell
mas install 1295203466
```

## Links

{{< cards cols="2" >}}
{{< card link="https://apps.apple.com/us/app/id1295203466" title="Mac App Store" icon="shopping-bag" subtitle="Free on the Mac App Store" >}}
{{< card link="https://learn.microsoft.com/en-us/windows-app/" title="Documentation" icon="book-open" subtitle="Microsoft documentation" >}}
{{< /cards >}}
