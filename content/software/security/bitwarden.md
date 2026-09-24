---
title: "Bitwarden"
weight: 1
description: "Open-source password manager, self-hostable."
---

{{< lead >}}Credentials, TOTP codes and secure notes in an end-to-end encrypted vault you can host yourself.{{< /lead >}}

{{< badge content="Mac App Store" color="purple" icon="shopping-bag" link="https://apps.apple.com/us/app/id1352778147" >}} {{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/bitwarden" >}} {{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/bitwarden-cli" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://bitwarden.com/download/" >}}

## What it does

Bitwarden stores passwords, passkeys, TOTP secrets, cards, identities and notes in a vault encrypted client-side — the server never sees plaintext or the master password. Clients exist for every platform, with browser extensions and CLI included.

For a homelab the significant part is that the server is open source and self-hostable: the official server, or **Vaultwarden**, a lightweight Rust reimplementation that runs comfortably in a container on a Raspberry Pi. Self-hosting means the vault's availability is your problem — and so is its backup.

## Notes

- The Mac app supports unlocking with Touch ID and autofill through the system Passwords integration.
- `bw` (the CLI, available via `brew install bitwarden-cli`) makes secrets scriptable, including in CI.
- Whatever else changes, the master password and the two-factor method are the whole security model. An offline copy of the recovery code matters more than any other setting.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [1Password](https://1password.com/) | Freemium | The most polished of the group on Apple platforms |
| [Apple Passwords](https://support.apple.com/en-us/120758) | Built in | Passkey support and family sharing |
| [KeePassXC](https://keepassxc.org/) | Open source | A local database file, no sync service at all |
| [Proton Pass](https://proton.me/pass) | Freemium | Audited, bundled with Proton's other services |
| [pass](https://www.passwordstore.org/) | Open source | GPG files in a Git repository, for people who want exactly that |
| [Vaultwarden](https://github.com/dani-garcia/vaultwarden) | Open source | A lightweight self-hosted server for these same clients |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Mac App Store" selected=true >}}

[Bitwarden on the Mac App Store](https://apps.apple.com/us/app/id1352778147)

Or with `mas`:

```shell
mas install 1352778147
```

{{< /tab >}}
{{< tab name="Homebrew" >}}

```shell
brew install --cask bitwarden      # desktop app
brew install bitwarden-cli        # bw CLI
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://bitwarden.com/download/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://bitwarden.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://apps.apple.com/us/app/id1352778147" title="Mac App Store" icon="shopping-bag" subtitle="Free on the Mac App Store" >}}
{{< card link="https://github.com/bitwarden/clients" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/dani-garcia/vaultwarden" title="Vaultwarden" icon="server" subtitle="Lightweight self-hosted server" >}}
{{< /cards >}}
