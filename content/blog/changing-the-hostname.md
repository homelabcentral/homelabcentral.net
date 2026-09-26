---
title: "Changing the hostname"
date: 2026-09-26T18:05:00+05:30
draft: false
authors:
  - name: Homelab Central
tags:
  - macos
  - ubuntu
  - networking
  - hostname
  - setup
excludeSearch: false
summary: "Rename a machine properly on macOS and Ubuntu, including the parts that quietly revert it on the next reboot."
tabs:
  sync: true
coverText: |
  hostname --change
---

{{< lead >}}
Rename a machine so the name sticks — in the shell, on the network, and after a reboot.
{{< /lead >}}

Every box in a homelab ends up named something. The trap is that "the
hostname" is not one value on either OS, so renaming half of it leaves you
with a machine that answers to two names.

<!--more-->

## Rename it

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

macOS keeps three separate names, and `scutil` sets all three.

| Name | What uses it |
| --- | --- |
| `ComputerName` | Finder, AirDrop, the Sharing pane. Spaces and emoji allowed |
| `LocalHostName` | Bonjour, the `.local` address. Letters, digits and hyphens only |
| `HostName` | What `hostname` and the shell prompt return |

{{% steps %}}

### Set all three

```shell
sudo scutil --set ComputerName "Rack 01"
sudo scutil --set LocalHostName "rack01"
sudo scutil --set HostName "rack01"
```

Read any of them back with `scutil --get ComputerName`.

{{< callout type="warning" >}}
Set `HostName` explicitly even if the other two look right. When it is unset,
macOS takes the name from DHCP and will rename itself back the next time it
picks up a lease.
{{< /callout >}}

### Flush the caches

```shell
sudo dscacheutil -flushcache
```

Bonjour keeps advertising the old `.local` name until it does.

### Open a new terminal

The prompt is built at login, so the window you typed this in keeps the old
name until you replace it.

{{% /steps %}}

{{< /tab >}}

{{< tab name="Ubuntu" icon="iconify:bi/ubuntu" >}}

One value, and `hostnamectl` owns it.

{{% steps %}}

### Set the hostname

```shell
hostnamectl
sudo hostnamectl set-hostname rack01
```

The optional pretty name is the Ubuntu equivalent of macOS's `ComputerName` —
free text, shown in GNOME:

```shell
sudo hostnamectl set-hostname "Rack 01" --pretty
```

### Fix /etc/hosts

`hostnamectl` does not touch `/etc/hosts`, so the old name is still mapped
there. Leave it and every `sudo` prints `unable to resolve host`:

```hosts {filename="/etc/hosts"}
127.0.0.1   localhost
127.0.1.1   rack01
```

### Stop cloud-init reverting it

On any image with cloud-init — Ubuntu Server, most VPS and VM templates — the
hostname is reapplied from metadata on every boot:

```yaml {filename="/etc/cloud/cloud.cfg"}
preserve_hostname: true
```

Without that line the rename survives until the next reboot and no longer.

{{% /steps %}}

{{< /tab >}}

{{< /tabs >}}

## Verify

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

```shell
hostname
scutil --get HostName
```

{{< /tab >}}

{{< tab name="Ubuntu" icon="iconify:bi/ubuntu" >}}

```shell
hostname
hostnamectl --static
```

{{< /tab >}}

{{< /tabs >}}

New shell, and both should agree.
