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

Name it after what it is for, and make one per purpose rather than reusing a
single key everywhere — a key you cannot revoke without breaking everything else
is a key you will not revoke. The rest of this post uses three:

| Key | For |
| --- | --- |
| `~/.ssh/id_ed25519_github` | GitHub |
| `~/.ssh/id_ed25519_homelab` | the NAS, and other boxes you own |
| `~/.ssh/id_ed25519` | the catch-all, for hosts with no block of their own |

Same command for each, changing `-f` and `-C`. To add a passphrase to a key that
has none — same key, nothing on any server changes:

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

Host * !github.com !nas
  IdentityFile ~/.ssh/id_ed25519

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

Two `Host *` blocks, not one, and the split is the point. `IdentityFile` lines
**accumulate**, so a default key in the same block as the behaviour would be added
to every host below — offered *before* the key that host actually names. Negating
the hosts that own a key keeps each of them at exactly one identity, while
anything unlisted still falls back to `~/.ssh/id_ed25519`.

{{< callout type="warning" >}}
Never put a negation on the block holding `AddKeysToAgent` and `UseKeychain`. A
negated host drops both and goes back to asking for its passphrase every session,
with nothing in the output to say why. Behaviour in the un-negated block, the
default identity in the negated one.
{{< /callout >}}

{{< callout type="warning" >}}
`IdentitiesOnly yes` is the line people skip. Without it ssh offers every key in
the agent, and a server with the default `MaxAuthTries 6` cuts you off with
`Too many authentication failures` before reaching the right one.
{{< /callout >}}

Because `IdentitiesOnly yes` is in the un-negated block it applies to unlisted
hosts too, so they get the catch-all key and nothing else — not `id_rsa`, not
whatever is in the agent. That is the intent, and the trade: a new host with its
own key needs two edits, its own block *and* an entry in the negation list.

### Fix the permissions

Do this before the first connection. `ssh` refuses to use a private key it
considers exposed, and says so plainly — `UNPROTECTED PRIVATE KEY FILE` — but the
failure that follows is the usual `Permission denied (publickey)`:

```shell
chmod 700 ~/.ssh
chmod 600 ~/.ssh/config ~/.ssh/id_ed25519_github
chmod 644 ~/.ssh/id_ed25519_github.pub
```

`ssh-keygen` already sets `600` on a key it creates. What it cannot fix is a
`~/.ssh` you made by hand, or a config copied in from another machine.

The matching rule on the far side is `sshd`'s, and it is stricter than most people
expect: with `StrictModes yes` — the default — a group- or world-writable home
directory makes `sshd` ignore that user's `authorized_keys` entirely. So on any
box you log *in* to, not on the laptop you log in *from*:

```shell
chmod go-w ~
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

`sshd` logs the reason it refused, and tells the client nothing — which is why
this one is usually found last. `sudo journalctl -u ssh -n 20` on the host, or
`/var/log/auth.log`, names the offending path immediately.

{{< callout type="info" >}}
These are ceilings, not exact values. A private key at `400` is stricter than
`600` and perfectly valid, so do not "fix" it upward — what matters is that group
and other hold no bits at all.
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

{{< callout type="info" >}}
**This step picks eager or lazy loading.**

Add the snippet for **eager**: every key the keychain holds goes into the agent
when you open a shell. Leave it out for **lazy**: each key loads on the first
connection that needs it, which the step 2 config already does on its own. Lazy is
the better default — eager is for the cases below. Either way nothing prompts you
for a passphrase.
{{< /callout >}}

```zsh {filename="~/.zshrc"}
if [[ -n $SSH_AUTH_SOCK ]] && ! ssh-add -l >/dev/null 2>&1; then
  ssh-add -q --apple-load-keychain 2>/dev/null
fi
```

**Use eager loading when** something needs keys in the agent before it connects to
anything: agent forwarding into a box that signs with a key you have not used yet
this session, a script that reads `ssh-add -l` to decide what it can reach, or a
long offline stretch where you want the keychain read while you still have it
unlocked.

**Prefer lazy otherwise**, for two reasons. It is less work — the config already
does it. And eager loading hides a broken config: with every key in the agent from
login, a host pointed at the wrong `IdentityFile` still connects, so the check in
[Prove the lazy load](#prove-the-lazy-load-rather-than-assuming-it) cannot tell you
anything, and you find the mistake on a machine where the keychain is empty.

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

## Check the config is right

Reading `~/.ssh/config` is not how you check it. ssh takes the **first** value it
sees for each keyword, but `IdentityFile` lines *accumulate* — so a `Host *` block
at the top quietly contributes a key to every host below it. Ask ssh what it
actually resolved:

```shell
ssh -G github.com | grep -E '^(user|hostname|identityfile|identitiesonly|addkeystoagent) '
```

```
user git
hostname github.com
identitiesonly yes
identityfile ~/.ssh/id_ed25519_github
addkeystoagent true
```

**One `identityfile` line, and `identitiesonly yes`.** That is the whole test.

Two `identityfile` lines means something above the block is contributing a key as
well — nearly always an `IdentityFile` in `Host *`, and it is offered *first*,
before the host's own. `IdentitiesOnly yes` keeps it from authenticating as the
wrong user, so nothing looks broken; every connection just tries the wrong key
before the right one.

The fix is the two-block split from earlier: behaviour in an un-negated `Host *`,
the default identity in a `Host *` that negates every host owning a key. A host
showing `keys=2` is one that belongs in that negation list and is not in it yet.

Check `addkeystoagent` in the same pass, because the other way to get this wrong
is to negate the block that carries it:

```shell
ssh -G nas | grep -E '^(identityfile|addkeystoagent) '
```

`addkeystoagent false` on a host that has a key means it lost lazy loading to a
negation, and will ask for its passphrase in every new session.

Check every host at once rather than one at a time:

```shell
awk '/^Host /{for (i=2; i<=NF; i++) if ($i !~ /[*?!]/) print $i}' ~/.ssh/config \
| while read -r h; do
    printf '%-24s ' "$h"
    ssh -G "$h" 2>/dev/null | awk '
      /^identityfile /{n++; f = f" "$2}
      /^identitiesonly /{io = $2}
      END {printf "io=%-4s keys=%d%s\n", io, n, f}'
  done
```

Every row should read `io=yes keys=1`. Anything with `keys=2` has a stray global
`IdentityFile`; anything with `io=no` is a host that can still authenticate as the
wrong account.

### Check `UseKeychain` is not being ignored

`IgnoreUnknown UseKeychain` is what lets the file load on Linux. It is also what
hides a `UseKeychain` being silently discarded on macOS, when Homebrew's OpenSSH
is ahead of Apple's on `PATH`. `ssh -G` never prints the option, so test whether
your ssh knows the keyword at all — without `IgnoreUnknown` to swallow it:

```shell
printf 'Host t\n  UseKeychain yes\n' > /tmp/kc
ssh -F /tmp/kc -G t >/dev/null && echo 'supported' || echo 'ignored — wrong ssh on PATH'
```

An unknown keyword is a hard error, so parsing at all is proof the option is real.
If it says `ignored`, `ssh` is Homebrew's: either use `/usr/bin/ssh` or drop
Homebrew's OpenSSH from `PATH`.

### Prove the lazy load rather than assuming it

The only honest test starts with an empty agent. Nothing is lost — `ssh-add -D`
clears the agent, not the keychain:

```shell
ssh-add -D
ssh -T git@github.com
ssh-add -l
```

Authenticating **with no passphrase prompt**, and finding the key in `ssh-add -l`
afterwards, is the whole mechanism working end to end: the config picked the key,
the keychain supplied the passphrase, `AddKeysToAgent` kept it for the rest of the
session. A prompt instead means the passphrase was never stored — run
`ssh-add --apple-use-keychain` on that key again.

To see which keys the keychain can restore, in one go rather than per host:

```shell
ssh-add -D && ssh-add --apple-load-keychain -q && ssh-add -l
```

Every passphrase-protected key you expect should be listed. One that is missing
will prompt on first use and works fine afterwards, which is exactly why it goes
unnoticed until a reboot.

## When it does not work

| Symptom | Cause |
| --- | --- |
| `Permission denied (publickey)` | Nothing in the agent, or the wrong `IdentityFile`. Check `ssh-add -l`, then `ssh -v` |
| `Too many authentication failures` | `IdentitiesOnly yes` missing |
| `Bad configuration option: usekeychain` | macOS-only option on Linux. Needs `IgnoreUnknown UseKeychain` |
| `unknown option -- apple-use-keychain` | Homebrew's OpenSSH is ahead of Apple's on `PATH` |
| Prompts again after a reboot | Passphrase was added with plain `ssh-add`, which is session-only |
| Authenticates, but as the wrong account | `IdentitiesOnly yes` missing on that host, or a stray `IdentityFile` in `Host *`. Check `ssh -G <host>` |
| Right key, but tried second | `Host *` contributes an `IdentityFile`; accumulated lines are offered in file order |
| One host prompts every session, others do not | It is negated on the block holding `AddKeysToAgent`. Check `ssh -G <host>` |
