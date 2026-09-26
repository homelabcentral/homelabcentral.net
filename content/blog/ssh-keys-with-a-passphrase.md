---
title: "SSH keys you only unlock once"
date: 2026-09-26T01:45:00+05:30
draft: false
authors:
  - name: Homelab Central
tags:
  - ssh
  - security
  - macos
  - ubuntu
  - zsh
excludeSearch: false
summary: "Create SSH keys and add them to a host or to GitHub or another version control service."
tabs:
  sync: true
coverText: |
  ssh-keygen -t ed25519
---

{{< lead >}}
Create a key with a passphrase, let the machine's keychain remember it, and never type it again.
{{< /lead >}}

A key with no passphrase is a password in a file. A key with one asks on every
push. The agent plus the login keychain fixes both: the passphrase is stored
encrypted, unlocked when you log in, and typed once.

<!--more-->

{{% steps %}}

### Create the key

```shell
ssh-keygen -t ed25519 -a 100 -f ~/.ssh/id_ed25519_github -C "you@laptop"
```

Name it after what it is for. To add a passphrase to a key that has none, same
key, nothing on any server changes:

```shell
ssh-keygen -p -a 100 -f ~/.ssh/id_ed25519_github
```

### Point each host at one key

```sshconfig {filename="~/.ssh/config"}
Host *
  IgnoreUnknown UseKeychain
  AddKeysToAgent yes
  UseKeychain yes
  IdentitiesOnly yes

Host github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_github

Host nas
  HostName 10.0.0.12
  User admin
  IdentityFile ~/.ssh/id_ed25519_homelab
```

`AddKeysToAgent` loads the key on first use. `UseKeychain` is macOS only, and
`IgnoreUnknown` is what stops Linux rejecting the whole file over it.

{{< callout type="warning" >}}
`IdentitiesOnly yes` is the line people skip. Without it ssh offers every key in
the agent, and a server with the default `MaxAuthTries 6` cuts you off with
`Too many authentication failures` before reaching the right one.
{{< /callout >}}

### Store the passphrase

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

```shell
ssh-add --apple-use-keychain ~/.ssh/id_ed25519_github
```

Prompts once, then writes the passphrase to the login keychain. `-K` is the old
name for the same flag.

{{< /tab >}}

{{< tab name="Ubuntu — desktop" icon="iconify:bi/ubuntu" >}}

Plain `ssh-add` only lasts the session. To keep it, add the key through the
askpass dialog and tick **Automatically unlock this key whenever I'm logged in**:

```shell
sudo apt install seahorse
systemctl --user enable --now gcr-ssh-agent.socket
/usr/lib/seahorse/ssh-askpass ~/.ssh/id_ed25519_github
```

{{< /tab >}}

{{< tab name="Ubuntu — headless" icon="iconify:bi/terminal" >}}

No desktop session, so no keyring to store it in. Run one agent per boot instead:

```shell
systemctl --user enable --now ssh-agent.service
loginctl enable-linger "$USER"
```

`AddKeysToAgent yes` then prompts on the first connection and stays quiet until
the next reboot. `enable-linger` is what keeps the agent alive after you log out.

{{< /tab >}}

{{< /tabs >}}

### Wire it into the shell

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

Optional — the config above already loads the key on first use. This fills the
agent up front, and never prompts:

```zsh {filename="~/.zshrc"}
if [[ -n $SSH_AUTH_SOCK ]] && ! ssh-add -l >/dev/null 2>&1; then
  ssh-add -q --apple-load-keychain 2>/dev/null
fi
```

{{< /tab >}}

{{< tab name="Ubuntu — desktop" icon="iconify:bi/ubuntu" >}}

Find the agent, then load the key using the passphrase already in the keyring.
The askpass helper supplies it without showing a dialog:

```zsh {filename="~/.zshrc"}
if [[ -z $SSH_AUTH_SOCK && -S $XDG_RUNTIME_DIR/gcr/ssh ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
fi

if [[ -n $SSH_AUTH_SOCK ]] && ! ssh-add -l >/dev/null 2>&1; then
  SSH_ASKPASS=/usr/lib/seahorse/ssh-askpass SSH_ASKPASS_REQUIRE=prefer \
    ssh-add ~/.ssh/id_ed25519_github </dev/null >/dev/null 2>&1
fi
```

{{< /tab >}}

{{< tab name="Ubuntu — headless" icon="iconify:bi/terminal" >}}

Nothing can hand over a passphrase here, so this asks — in the first terminal
after a boot, and not again:

```zsh {filename="~/.zshrc"}
if [[ -z $SSH_AUTH_SOCK && -S $XDG_RUNTIME_DIR/ssh-agent.socket ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

if [[ -n $SSH_AUTH_SOCK && -z $VSCODE_RESOLVING_ENVIRONMENT ]] \
   && ! ssh-add -l >/dev/null 2>&1; then
  ssh-add ~/.ssh/id_ed25519_github
fi
```

The `VSCODE_RESOLVING_ENVIRONMENT` test keeps it out of the shell VS Code spawns
to read your environment, which has no terminal to prompt on and would hang.

{{< /tab >}}

{{< /tabs >}}

Both guards earn their place. `ssh-add -l` returns non-zero only when the agent
is empty, so the key is added once and every later shell skips the block —
without it, an unguarded `ssh-add` prompts in every new terminal. The `-z` test
on `SSH_AUTH_SOCK` stops a forwarded agent being thrown away when you SSH into
the machine.

### Add the key to GitHub

Copy the **public** half — never the file without `.pub`:

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

```shell
pbcopy < ~/.ssh/id_ed25519_github.pub
```

{{< /tab >}}

{{< tab name="Ubuntu — desktop" icon="iconify:bi/ubuntu" >}}

```shell
wl-copy < ~/.ssh/id_ed25519_github.pub          # Wayland
xclip -sel clip < ~/.ssh/id_ed25519_github.pub  # X11
```

{{< /tab >}}

{{< tab name="Ubuntu — headless" icon="iconify:bi/terminal" >}}

No clipboard. Print it and copy from the terminal, or skip the paste entirely
and use `gh` below:

```shell
cat ~/.ssh/id_ed25519_github.pub
```

{{< /tab >}}

{{< /tabs >}}

Paste it at [github.com/settings/keys](https://github.com/settings/keys), or from
the CLI:

```shell
gh ssh-key add ~/.ssh/id_ed25519_github.pub --title "laptop"
```

GitLab is **Settings → SSH Keys**, Bitbucket **Personal settings → SSH keys**, and
both take the same file. Test it:

```shell
ssh -T git@github.com
```

### Optionally, add it to another host

```shell
ssh-copy-id -i ~/.ssh/id_ed25519_homelab.pub you@10.0.0.12
```

Pass `-i` explicitly, or it copies every key the agent holds. Without
`ssh-copy-id`:

```shell
cat ~/.ssh/id_ed25519_homelab.pub | ssh you@10.0.0.12 \
  'install -d -m 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys'
```

Those permissions matter — `sshd` ignores `authorized_keys` if it is
group-writable, and says nothing about why.

{{% /steps %}}

## When it does not work

| Symptom | Cause |
| --- | --- |
| `Permission denied (publickey)` | Nothing in the agent, or the wrong `IdentityFile`. Check `ssh-add -l`, then `ssh -v` |
| `Too many authentication failures` | `IdentitiesOnly yes` missing |
| `Bad configuration option: usekeychain` | macOS-only option on Linux. Needs `IgnoreUnknown UseKeychain` |
| `unknown option -- apple-use-keychain` | Homebrew's OpenSSH is ahead of Apple's on `PATH` |
| Prompts again after a reboot | Passphrase was added with plain `ssh-add`, which is session-only |
