---
title: "Passwords and Keychain Access"
weight: 2
description: "The credential store macOS already has, and the utility underneath it."
---

{{< lead >}}Every Mac already has an encrypted, syncing, biometric-unlocked password manager. Most people meet it as a Safari popup and never open it.{{< /lead >}}

## What it does

**Passwords** is the app Apple split out of System Settings in macOS 15. It holds passwords, passkeys, verification codes, Wi-Fi networks and sign-in-with-Apple entries, autofills them in Safari and in any app that adopts the system autofill API, and unlocks with Touch ID. Shared groups let a household or a team hold a set of credentials together, and the security recommendations flag reused, weak and breached passwords against Apple's own breach data.

**Keychain Access** is the older utility and still the honest view of the store. It shows every keychain on the machine, not only the login one — certificates, private keys, secure notes, certificate trust settings, and the System keychain that holds machine-wide items. Anything that is not a website login lives here, and nowhere else.

```shell
# read a stored password, prompting for authorisation
security find-generic-password -s "some-service" -w

# store one, scriptably
security add-generic-password -s "some-service" -a "$USER" -w "secret"

# what certificates does this machine trust
security find-certificate -a -p /Library/Keychains/System.keychain
```

## The two are the same store

Passwords and Keychain Access read the same keychain database; Passwords simply hides everything that is not a login. iCloud Keychain is what syncs it, end-to-end encrypted, to every device on the Apple ID — and it is the reason the credential store survives a machine being replaced.

The limits follow from that. It syncs to Apple devices and Windows (through the iCloud app and a browser extension), and nowhere else. There is no Linux client, no self-hosted server, and no export format worth the name.

## The equivalent elsewhere

On a Linux desktop the same job belongs to the **Secret Service** API: GNOME Keyring or KWallet holds the secrets, **Seahorse** ("Passwords and Keys") is the GUI, and `secret-tool` from `libsecret` is the command line. On Ubuntu it is already running — `gnome-keyring-daemon` is what unlocks with the login password and what `git`, `ssh` and Docker store credentials in.

```shell
sudo apt install libsecret-tools seahorse

secret-tool store --label='some-service' service some-service username "$USER"
secret-tool lookup service some-service username "$USER"
secret-tool search --all service some-service
```

The shape matches `security` closely enough that a script can abstract over both: a lookup by attributes, unlocked by the desktop session, with the GUI as an afterthought.

## Notes

- A keychain item's ACL decides which binaries may read it without prompting. A prompt naming an application you do not recognise is worth reading rather than clicking through.
- Local Items / iCloud keychain entries cannot be exported in bulk by design. Migrating to another manager means Passwords' own CSV export, which is plaintext — delete the file afterwards, and not to the Trash.
- Touch ID unlocking is a convenience over the login password, not a separate secret. The account password remains the thing protecting the login keychain.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Bitwarden](/software/security/bitwarden/) | Open source | Every platform, self-hostable, and an actual export story |
| [1Password](https://1password.com/) | Freemium | More polish and better sharing, and the most Mac-native of the third-party options |
| [KeePassXC](https://keepassxc.org/) | Open source | A local database file you sync yourself |
| [Proton Pass](https://proton.me/pass) | Freemium | Audited, and bundled with [Proton VPN](/software/networking/proton-vpn/) |
| [pass](https://www.passwordstore.org/) | Open source | GPG files in a Git repository, for people who want exactly that |
{{< /borderless-table >}}

## Install

Nothing to install. **Passwords** is in `/System/Applications` on macOS 15 and later; **Keychain Access** is in `/System/Applications/Utilities`, on every version.

```shell
open -a Passwords
open -a "Keychain Access"
```

## Links

{{< cards cols="2" >}}
{{< card link="https://support.apple.com/guide/passwords/welcome/mac" title="Passwords user guide" icon="book-open" subtitle="Apple's documentation" >}}
{{< card link="https://support.apple.com/guide/keychain-access/welcome/mac" title="Keychain Access user guide" icon="book-open" subtitle="Apple's documentation" >}}
{{< card link="https://support.apple.com/en-us/102195" title="iCloud Keychain security" icon="shield-check" subtitle="How the sync is encrypted" >}}
{{< card link="https://specifications.freedesktop.org/secret-service-spec/latest/" title="Secret Service API" icon="terminal" subtitle="The specification secret-tool speaks" >}}
{{< /cards >}}
