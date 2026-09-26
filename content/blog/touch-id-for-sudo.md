---
title: "Touch ID for sudo"
date: 2026-09-26
draft: false
authors:
  - name: Homelab Central
tags:
  - macos
  - sudo
  - touchid
  - security
excludeSearch: false
summary: "Authenticate sudo with your fingerprint instead of your password, in the terminal and inside tmux."
# `coverText` renders in the card cover slot with the prompt glyph from
# params.command.prompt until there is a real cover image.
coverText: |
  sudo --use-touch-id
---

{{< lead >}}
Two lines to use touchid to authenticate sudo and with tmux.
{{< /lead >}}

Touch ID is the best thing on a Mac. It logs you in, pays for things, signs you
into Apple's own sites. So the obvious question: can it authenticate `sudo`
too? It can, and it takes two minutes.

<!--more-->

## Works on

{{< badge content="Sonoma 14" color="green" icon="iconify:bi/apple" size="lg" >}} {{< badge content="Sequoia 15" color="blue" icon="iconify:bi/apple" size="lg" >}} {{< badge content="Tahoe 26" color="indigo" icon="iconify:bi/apple" size="lg" >}} {{< badge content="Golden Gate 27" color="purple" icon="iconify:bi/apple" size="lg" >}}

`/etc/pam.d/sudo_local` arrived in Sonoma. On Ventura 13 and earlier neither it
nor its template exists: the same `auth sufficient pam_tid.so` line goes into
`/etc/pam.d/sudo` itself, and every major OS update wipes it.

## Touch ID for sudo

{{% steps %}}

### Open a root shell first

In a second window, and leave it open until everything below works:

```shell
sudo -s
```

{{< callout type="warning" >}}
A broken file in `/etc/pam.d` makes every `sudo` fail — including the one you
need to fix it. This shell is already root, so it keeps working no matter what
you do to the config. Close it only once Touch ID prompts.
{{< /callout >}}

### Copy the template

macOS ships the file already written, commented out:

```shell
sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
```

`/etc/pam.d/sudo` has an `auth include sudo_local` line at the top, and
`sudo_local` is the half that survives OS updates. Adding `pam_tid.so` straight
into `/etc/pam.d/sudo` works too — until the next update replaces it.

### Uncomment the line

```shell
sudo sed -i '' 's/^#auth/auth/' /etc/pam.d/sudo_local
```

Which leaves:

```pam {filename="/etc/pam.d/sudo_local"}
auth       sufficient     pam_tid.so
```

`sufficient` is the important word: Touch ID succeeding is enough, and Touch ID
not being available falls through to the password prompt.

### Verify it

```shell
sudo -k
sudo -v
```

`sudo -k` drops the cached credential, and `sudo -v` asks for authentication and
runs nothing — the harmless way to see the prompt. It should be the Touch ID
sheet, not a password.

{{% /steps %}}

> [!NOTE]
> PAM reads the file on every `sudo`, so the change should apply immediately. If
> you still get a password prompt, open a new terminal window, and if that does
> not do it either, quit and reopen the terminal app.

## Touch ID for sudo inside tmux

The line above works in Terminal, iTerm2, Ghostty — and not in a tmux pane,
where you get the password prompt instead.

`pam_tid.so` has to reach the GUI session to raise the biometric prompt, and it
looks for it in the per-session bootstrap namespace of the process asking. A
tmux server is a daemon: it keeps the namespace of whichever shell first started
it, detached from your Aqua session. Nothing to prompt on, so PAM falls through
to the password.

[`pam_reattach`](https://github.com/fabianishere/pam_reattach) moves the
authentication into the right namespace before `pam_tid.so` runs.

{{% steps %}}

### Install the module

```shell
brew install pam-reattach
```

That builds it and links the module into Homebrew's prefix. Check it landed:

```shell
ls -l "$(brew --prefix)/lib/pam/pam_reattach.so"
```

{{% details title="Without Homebrew" %}}

CMake, and nothing else:

```shell
git clone https://github.com/fabianishere/pam_reattach
cd pam_reattach
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local
cmake --build build
cmake --install build
```

Three commands, not two — `cmake --install` only copies what `cmake --build`
produced. The module lands at `/usr/local/lib/pam/pam_reattach.so`. Add
`-DCMAKE_OSX_ARCHITECTURES="arm64;x86_64"` to the configure step for a
universal build, and to remove it later:

```shell
xargs rm < build/install_manifest.txt
```

{{% /details %}}

### Get the path right

PAM searches `/usr/lib/pam` and `/usr/local/lib/pam`, and nothing else.
Installed from source into `/usr/local`, or by Homebrew on an Intel Mac, the
module can be named on its own. Homebrew on Apple Silicon puts it under
`/opt/homebrew`, which is neither, so the line needs the full path. Print it
rather than guessing:

```shell
echo "auth       optional       $(brew --prefix)/lib/pam/pam_reattach.so ignore_ssh"
```

### Put it above pam_tid

```shell
sudo nano /etc/pam.d/sudo_local
```

Paste the line from the previous step above the `pam_tid.so` line:

```pam {filename="/etc/pam.d/sudo_local"}
auth       optional       /opt/homebrew/lib/pam/pam_reattach.so ignore_ssh
auth       sufficient     pam_tid.so
```

Order is the whole point — reattaching after the Touch ID attempt has already
failed does nothing. Two words earn their place:

- `optional` keeps a missing or broken module from mattering. Uninstall
  `pam-reattach` later and `sudo` asks for your password again instead of
  refusing you.
- `ignore_ssh` skips the reattach when `$SSH_CLIENT`, `$SSH_CONNECTION` or
  `$SSH_TTY` is set. Without it, `sudo` in a tmux session you reached over SSH
  asks for a touch on a laptop you are not sitting at.

### Verify it

Inside a pane, and then outside one, so you know both still work:

```shell
tmux new -A -s touchid-test
sudo -k
sudo -v
```

{{% /steps %}}

> [!NOTE]
> Again, the next `sudo` should pick the change up on its own. If a pane still
> asks for a password, restart the tmux server — `tmux kill-server`, which ends
> every session on it — and reattach. If it survives even that, quit and reopen
> the terminal app.

> [!NOTE]
> Anything else that starts a shell outside your GUI session can show the same
> symptom. The integrated terminals in VS Code and JetBrains IDEs usually need
> nothing, being children of the app itself — but if one of them asks for a
> password while Terminal does not, it is this same cause and this same fix.

## When it does not work

| Symptom                                           | Cause                                                           |
| ------------------------------------------------- | --------------------------------------------------------------- |
| Password prompt in tmux, Touch ID everywhere else | `pam_reattach` missing, or listed below `pam_tid.so`            |
| Password prompt over SSH                          | No sensor at the far end. Expected — `sufficient` falls through |
| Works, then stops after an OS update              | The line went into `/etc/pam.d/sudo`, not `sudo_local`          |
| Nothing prompts and the password is refused       | Typo in `sudo_local`. Fix it from the root shell you kept open  |

## The finished file

Both halves together, and nothing else in it:

```pam {filename="/etc/pam.d/sudo_local"}
# sudo_local: local config file which survives system update and is included for sudo
auth       optional       /opt/homebrew/lib/pam/pam_reattach.so ignore_ssh
auth       sufficient     pam_tid.so
```

Drop the first `auth` line if you never use tmux. `/etc/pam.d/sudo` stays
untouched — it already includes this file.
