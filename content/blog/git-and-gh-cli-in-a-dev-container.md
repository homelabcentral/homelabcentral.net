---
title: "git and gh CLI in a dev container"
date: 2026-09-19
draft: false
authors:
  - name: Homelab Central
tags:
  - devcontainer
  - vscode
  - github
  - git
  - ssh
  - security
  - dev
excludeSearch: false
# The excerpt shown on the blog card and on tag pages. Card-only here: the
# `<!--more-->` marker further down outranks front matter for Hugo's own
# `.Summary`, which is what feeds `<meta name="description">` and
# `og:description`, so the meta text stays the lead paragraph. Without this
# key the card would show that same lead, which is written to open the post
# rather than to sell it in two lines.
summary: "Two GitHub identities on one laptop, kept apart by a dev container, an SSH key and a token. Runs the same on macOS, Ubuntu and Windows with WSL."
# Keeps every platform tab block on the page in step with the others.
tabs:
  sync: true
# `coverText` renders the title line in the card's cover slot, with the prompt
# glyph from params.command.prompt, until there is a real cover image.
coverText: |
  gh auth in a box
---

{{< lead >}}
Two GitHub identities on one laptop: your work account for work, your personal account for everything else. A dev container, an SSH key, and a token keep them apart. Platform agnostic - Runs on mac OS, linux and windows with WSL.
{{< /lead >}}

## The problem

You are deep in a work project and the open source tool you depend on has a
bug. You know the fix. It is ten lines.

On a good day you would clone the repo, patch it, open a pull request, and move
on. But the repo belongs to your personal GitHub account, and you are on the
work laptop. So you wait. You get home, open the personal laptop, try to
remember what the bug was, and fix it then.

Except with a back-to-office mandate the personal laptop is not always with
you. The context switch is expensive. And often enough the fix never gets
pushed at all, which helps nobody — least of all the project you took the fix
from.

What you actually want is both identities on the machine you already have, with
no chance of one acting as the other.

<!--more-->

## The solution

Docker settled *"it works on my machine"* by shipping the runtime. A dev
container settles the question after it — *"it develops on my machine"* — by
shipping the environment you work in. Add git and `gh`, and it ships the
identity you work as.

Three pieces, each doing one job:

{{< cards cols="3" >}}
{{< card title="Dev container" icon="cube" subtitle="A reproducible environment per project, isolated from your work setup." >}}
{{< card title="SSH key" icon="key" subtitle="Your personal git identity, for clone, push and pull." >}}
{{< card title="GitHub token" icon="lock-closed" subtitle="Your personal gh identity, for pull requests and everything else on the API." >}}
{{< /cards >}}

Open the folder, VS Code builds the container, and inside it you are your
personal self. Close the window and you are back to work. Nothing on the host
changes, and no credential is written to the repository.

It is also deliberately platform agnostic. The same repository, the same
`devcontainer.json`, the same `docker-compose.yml` — on the Ubuntu desktop at
home and on the work MacBook, without a per-machine branch anywhere in the
project. The container is Linux either way, so nothing inside it knows or cares
what it is running on.

Exactly one thing differs between the two machines, and it is on the host, not
in the repo: the command that reads the token out of the local secret store.
macOS has the login keychain, Ubuntu has the login keyring or `pass`. One line
in your shell profile, different on each machine, and everything downstream is
identical.

## Why both git and gh

They do different jobs.

**git** moves code. Clone, commit, push, pull.

**gh** does everything around the code. Open the pull request, comment on the
issue, cut the release.

Sending the fix upstream needs both: git to push the branch, `gh` to open the
pull request. git cannot open a pull request, and `gh` cannot push a commit.

Two tools, so two logins — and they do not share one.

| Tool | Signs in with | Where it comes from |
| --- | --- | --- |
| git | SSH key | your host `ssh-agent`, forwarded into the container |
| `gh` | token | `GH_TOKEN` in the container's environment |

Set up one and the other still does not work. So set up both.

### Git uses the SSH key

Your keys never enter the container. VS Code forwards the host `ssh-agent`
automatically, and the agent does the signing — the container just asks it to.

What the container *does* need is your `~/.ssh/config`, mounted read-only, so
ssh knows which key to ask for. With more than one key in the agent, ssh cannot
guess: it tries them in order and GitHub answers with whichever account matches
the first one that works. A host alias plus `IdentitiesOnly yes` makes the
choice explicit.

### gh uses the token

`gh` does not speak SSH at all. Every command it runs is an HTTPS API call, and
it authenticates with a token.

That token comes from your host's secret store, gets exported only while VS
Code is working out the container's environment, and is passed in under the
name `GH_TOKEN`. It is never written to a file, and your host's own `gh` login
is left completely alone.

{{< callout type="info" >}}
The rename matters. `gh` prefers `GH_TOKEN` over its stored credentials, so
exporting it under that name on the host would quietly re-authenticate every
terminal you have as the wrong account. Under any other name, nothing on the
host notices.
{{< /callout >}}

---

## How to do it

{{% steps %}}

### Create a key for the second identity

If you already have a personal SSH key on this machine, skip ahead. Otherwise:

```shell
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_personal -C "personal"
```

Add the public half to GitHub under **Settings → SSH and GPG keys**, on the
personal account.

```shell
cat ~/.ssh/id_ed25519_personal.pub
```

### Teach ssh which key belongs to which account

Give the second identity its own `Host` alias, and tell ssh to use *only* the
key you named. Both halves matter.

Change `~/.ssh/id_ed25519` below to whatever your existing work key actually
is. Adding `IdentitiesOnly yes` makes that line binding, so a wrong path there
locks you out of your work repositories.

```sshconfig {filename="~/.ssh/config"}
Host *
  IgnoreUnknown UseKeychain

Host github.com
  User git
  AddKeysToAgent yes
  UseKeychain yes
  IdentitiesOnly yes
  IdentityFile ~/.ssh/id_ed25519

Host github-personal
  HostName github.com
  User git
  AddKeysToAgent yes
  UseKeychain yes
  IdentitiesOnly yes
  IdentityFile ~/.ssh/id_ed25519_personal
```

{{< callout type="warning" >}}
`IdentitiesOnly yes` is the part people leave out, and without it the rest does
not hold. On its own, `IdentityFile` is a *preference*: ssh still offers every
key your agent is holding, in whatever order the agent returns them, and GitHub
authenticates you as whichever one matches first. That can easily be the other
account — and you will not notice, because the connection succeeds.

`IdentitiesOnly yes` restricts each host to the key it names, so the config
actually decides.
{{< /callout >}}

Load the new key into the agent once, on the host:

```shell
ssh -T github-personal
```

This matters more than it looks. The container gets its keys from the forwarded
agent, and the agent only holds what has been added to it. `AddKeysToAgent yes`
adds a key the first time you use it — on the host. Until that has happened at
least once, there is nothing to forward and git inside the container fails with
`Permission denied (publickey)`.

Then point the repository at the alias, and git picks the right key every time:

```shell
git remote set-url origin github-personal:you/your-project.git
```

If the project is not yours, fork it first — you cannot push to someone else's
repository, so `origin` has to be your copy:

```shell
gh repo fork owner/project --clone
git remote set-url origin github-personal:you/project.git
```

`gh repo fork --clone` sets `origin` to your fork and `upstream` to the
original, which is what `gh pr create` expects. Run it inside the container,
where `gh` is already authenticated as the personal account.

Set the matching identity on the repo too, so commits are attributed correctly:

```shell
git config user.name "Your Name"
git config user.email "you@personal.example"
```

{{< callout type="error" >}}
`UseKeychain` is macOS-only. Without `IgnoreUnknown UseKeychain` in a leading
`Host *` block, Linux OpenSSH rejects the **whole file** with
`Bad configuration option: usekeychain` — and every host in it stops resolving,
inside the container and out.
{{< /callout >}}

### Create a token for gh

Which kind of token you need depends on whose repository you are working on,
and this is the one place where GitHub's newer fine-grained tokens will quietly
not do the job.

| You are working on | Token type | Scope or permissions |
| --- | --- | --- |
| Your own repositories, or your organisation's | Fine-grained | the specific repositories |
| Someone else's project, through a fork | Classic | `public_repo` |

{{< callout type="warning" >}}
A fine-grained token can only act on repositories owned by its **resource
owner** — you, or an organisation you belong to. Opening a pull request is a
call against the *upstream* repository, so for a project you do not own the
token has no reach and `gh pr create` fails with:

```text
GraphQL: Resource not accessible by personal access token (createPullRequest)
```

There is no way to grant it: you cannot create a fine-grained token whose
resource owner is a stranger's account. Contributing upstream needs a classic
token.
{{< /callout >}}

**Contributing to other people's projects** —
[github.com/settings/tokens/new](https://github.com/settings/tokens/new),
signed in as the personal account. Tick `public_repo`, which covers pushing to
your forks and opening pull requests anywhere public. Use the broader `repo`
only if you also work on private repositories, and add `workflow` only if you
edit files under `.github/workflows/`.

**Working on your own repositories** —
[github.com/settings/personal-access-tokens/new](https://github.com/settings/personal-access-tokens/new)
gives you something much tighter:

| Field | Value |
| --- | --- |
| Resource owner | the account that **owns the repository** |
| Repository access | **Only select repositories**, or all of yours for drive-by work |

| Permission | Level | Needed for |
| --- | --- | --- |
| Metadata | Read-only | mandatory, granted automatically |
| Contents | Read and write | reading files through the API, releases |
| Pull requests | Read and write | `gh pr create`, `gh pr merge` |
| Issues | Read and write | `gh issue` — skip it if you do not use it |
| Workflows | Read and write | only if you edit `.github/workflows/` |

Either way, give it an expiry you will actually notice — 90 days is a reasonable
default — and copy the value. GitHub shows it once.

> [!IMPORTANT]
> For a fine-grained token on an organisation's repository, the token is created
> in a **pending** state and an organisation owner has to approve it before it
> works at all.

### Store the token on the host

Never in the repo, never in a `.env`. Put it in the machine's own secret store.

Pick your platform below — the tabs stay in sync for the rest of the page. On
Remote SSH, "the host" means the **remote** machine, not your laptop.

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

The login keychain, unlocked when you log in. `security` is built in.

```shell
security add-generic-password -a personal -s gh-token-personal -U -w
```

Leave `-w` bare and last. `security` then prompts for the value instead of
taking it as an argument, so the token never lands in your shell history or in
the process table. `-U` updates an existing item, which is what you want when
rotating.

Read it back:

```shell
security find-generic-password -a personal -s gh-token-personal -w
```

{{< /tab >}}

{{< tab name="Ubuntu — graphical login" icon="iconify:bi/ubuntu" >}}

A desktop session has a login keyring, unlocked by PAM when you sign in. That
is the direct counterpart to the macOS keychain.

```shell
sudo apt install libsecret-tools
```

```shell
secret-tool store --label='gh-token-personal' \
  account personal service gh-token-personal
```

`secret-tool` prompts for the value and reads it from stdin, same as bare `-w`
above.

Read it back:

```shell
secret-tool lookup account personal service gh-token-personal
```

`account` and `service` are not special names. Unlike `security`, where `-a`
and `-s` are fixed fields, libsecret attributes are arbitrary key/value pairs
you invent — these just mirror the macOS command. Lookup matches exact strings,
so a typo returns empty rather than an error.

{{< /tab >}}

{{< tab name="Ubuntu — no graphical login" icon="iconify:bi/terminal" >}}

A headless server, a Remote SSH target, or WSL has no unlocked login keyring,
and `secret-tool` will quietly return nothing. Use `pass`, which is GPG-backed
and does not need a desktop session.

```shell
sudo apt install pass
```

If there is no GPG key on the box yet:

```shell
gpg --quick-generate-key "you@personal.example" default default never
pass init you@personal.example
```

Store and read:

```shell
pass insert personal/gh-token
pass show personal/gh-token
```

One ordering detail matters: VS Code resolves your shell environment
non-interactively, so if `gpg-agent` still wants the passphrase it has nowhere
to prompt and the token comes back empty. Unlock once per boot before launching
the editor, and give the agent a long cache in `~/.gnupg/gpg-agent.conf`:

```ini
default-cache-ttl 34560000
max-cache-ttl 34560000
```

{{< /tab >}}

{{< /tabs >}}

### Export it for VS Code only

At startup VS Code spawns an interactive login shell — `$SHELL -i -l -c` —
purely to capture your environment, and sets `VSCODE_RESOLVING_ENVIRONMENT=1`
while doing it.

Hang the export off that variable and the token exists in exactly one transient
process, and in no terminal you ever type into.

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

```zsh {filename="~/.zshrc"}
if [[ -n $VSCODE_RESOLVING_ENVIRONMENT ]]; then
  export PERSONAL_GH_TOKEN="$(security find-generic-password \
    -a personal -s gh-token-personal -w 2>/dev/null)"
fi
```

{{< /tab >}}

{{< tab name="Ubuntu — graphical login" icon="iconify:bi/ubuntu" >}}

```zsh {filename="~/.zshrc"}
if [[ -n $VSCODE_RESOLVING_ENVIRONMENT ]]; then
  export PERSONAL_GH_TOKEN="$(secret-tool lookup \
    account personal service gh-token-personal 2>/dev/null)"
fi
```

{{< /tab >}}

{{< tab name="Ubuntu — no graphical login" icon="iconify:bi/terminal" >}}

```zsh {filename="~/.zshrc"}
if [[ -n $VSCODE_RESOLVING_ENVIRONMENT ]]; then
  export PERSONAL_GH_TOKEN="$(pass show personal/gh-token 2>/dev/null)"
fi
```

{{< /tab >}}

{{< /tabs >}}

Two details worth knowing. The `2>/dev/null` is not cosmetic: anything written
to stderr during environment resolution can corrupt what VS Code parses back.
And keep the block fast — VS Code gives shell resolution ten seconds before it
gives up with *"Unable to resolve your shell environment in a reasonable
time"*, and when it gives up your token is simply absent.

Using bash, the same block goes in `~/.bashrc`; VS Code runs the shell as both
interactive and login, so make sure your `~/.bash_profile` sources `~/.bashrc`,
as Ubuntu's default already does. For fish, use
`test -n "$VSCODE_RESOLVING_ENVIRONMENT"` in `~/.config/fish/config.fish`.

### Wire it into the container

Two things go in: the token as `GH_TOKEN`, and your `~/.ssh` folder mounted
read-only so ssh can read the config and pick the right key.

How you declare them depends on how the dev container is built. Compose-based
containers put both in `docker-compose.yml`; the simpler image- or
Dockerfile-based ones put them straight in `devcontainer.json`.

{{< tabs >}}

{{< tab name="docker-compose.yml" icon="iconify:simple-icons/docker" selected=true >}}

```yaml {filename=".devcontainer/docker-compose.yml",hl_lines=[6]}
services:
  dev:
    image: mcr.microsoft.com/devcontainers/base:ubuntu
    user: vscode
    environment:
      - GH_TOKEN=${PERSONAL_GH_TOKEN:-}
    volumes:
      - ..:/workspaces/your-project:cached
      - type: bind
        source: ${HOME}/.ssh
        target: /home/vscode/.ssh
        read_only: true
    command: sleep infinity
```

Compose reads `${...}` straight from the environment it is invoked with, which
is the one VS Code just resolved. `:-` supplies an empty default, so an unset
variable is quiet rather than fatal — `gh` is simply unauthenticated then.

Write the SSH mount in long syntax, not as a string. On the compose code path
the dev containers CLI uses, a mount string's `readonly` flag is silently
dropped; `read_only: true` under long syntax survives.

Your `devcontainer.json` still exists alongside this, pointing at the compose
file and naming the service:

```json {filename=".devcontainer/devcontainer.json"}
{
  "name": "your-project",
  "dockerComposeFile": "docker-compose.yml",
  "service": "dev",
  "workspaceFolder": "/workspaces/your-project"
}
```

{{< /tab >}}

{{< tab name="devcontainer.json" icon="iconify:codicon/vm" >}}

No compose file, so both go in `devcontainer.json` directly:

```json {filename=".devcontainer/devcontainer.json",hl_lines=[6]}
{
  "name": "your-project",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "remoteUser": "vscode",
  "remoteEnv": {
    "GH_TOKEN": "${localEnv:PERSONAL_GH_TOKEN}"
  },
  "mounts": [
    "source=${localEnv:HOME}/.ssh,target=/home/vscode/.ssh,type=bind,readonly"
  ]
}
```

`${localEnv:...}` reads from the environment VS Code resolved — the same one
compose would have read. An unset variable becomes an empty string, so a missing
token leaves `gh` unauthenticated rather than breaking the build.

Here the `readonly` flag in the mount string is honoured. That flag only gets
dropped on the compose conversion path, which is why the other tab needs long
syntax and this one does not.

{{< callout type="info" >}}
Use `remoteEnv`, not `containerEnv`. `containerEnv` bakes the value into the
container itself: it shows up in `docker inspect`, and it is fixed until you
rebuild, so a rotated token means a full rebuild. `remoteEnv` is applied by VS
Code to terminals, tasks and debug sessions, so nothing is stored in the
container's configuration and a new token is picked up when you reconnect.

It is the same choice the dev containers CLI makes for its own `--secrets-file`.
{{< /callout >}}

{{< /tab >}}

{{< /tabs >}}

> [!NOTE]
> Either way, nothing is written to disk. No `.env`, and no plaintext copy of
> the token lands in the files VS Code generates under its `globalStorage`.

#### A tighter SSH mount

Mounting the whole `~/.ssh` folder is the shortest path, not the tightest one.

Your private keys do not travel through that mount. VS Code forwards the host
`ssh-agent` automatically and the agent does the signing; the mount exists only
so ssh can read `~/.ssh/config`, because configuration is not part of the agent
protocol. The keys are along for the ride, readable by anything in the
container, for no reason.

Two ways to narrow it. Both keep the forwarded agent exactly as it is.

**Option 1 — mount only the two files ssh actually reads.** `config` to resolve
the alias, `known_hosts` so GitHub's host key is already trusted:

{{< tabs >}}

{{< tab name="docker-compose.yml" icon="iconify:simple-icons/docker" selected=true >}}

```yaml {filename=".devcontainer/docker-compose.yml"}
services:
  dev:
    image: mcr.microsoft.com/devcontainers/base:ubuntu
    user: vscode
    environment:
      - GH_TOKEN=${PERSONAL_GH_TOKEN:-}
    volumes:
      - ..:/workspaces/your-project:cached
      - type: bind
        source: ${HOME}/.ssh/config
        target: /home/vscode/.ssh/config
        read_only: true
      - type: bind
        source: ${HOME}/.ssh/known_hosts
        target: /home/vscode/.ssh/known_hosts
        read_only: true
    command: sleep infinity
```

{{< /tab >}}

{{< tab name="devcontainer.json" icon="iconify:codicon/vm" >}}

```json {filename=".devcontainer/devcontainer.json"}
{
  "name": "your-project",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "remoteUser": "vscode",
  "remoteEnv": {
    "GH_TOKEN": "${localEnv:PERSONAL_GH_TOKEN}"
  },
  "mounts": [
    "source=${localEnv:HOME}/.ssh/config,target=/home/vscode/.ssh/config,type=bind,readonly",
    "source=${localEnv:HOME}/.ssh/known_hosts,target=/home/vscode/.ssh/known_hosts,type=bind,readonly"
  ]
}
```

{{< /tab >}}

{{< /tabs >}}

One line changed, private keys never exposed. Both files must already exist on
the host or the bind fails — `known_hosts` does if you have ever connected to
GitHub from this machine.

**Option 2 — drop the ssh config and tell git directly.** Set the key per
repository instead:

```shell
git config core.sshCommand \
  'ssh -i ~/.ssh/id_ed25519_personal.pub -o IdentitiesOnly=yes'
```

That lands in `.git/config`, which is already inside the bind-mounted
workspace, so it reaches the container with no extra configuration. Leave the
`~` unexpanded — git runs the command through a shell, and the same value then
works on the host and in the container.

The part that looks wrong is `-i` pointing at a **public** key. It works because
the private half is in the forwarded agent: ssh uses the public key to choose
which agent identity to offer, and the agent signs. `IdentitiesOnly yes` stops
it offering anything else.

The container still needs to read that `.pub` file and `known_hosts`. Both are
public, so mount just those two:

{{< tabs >}}

{{< tab name="docker-compose.yml" icon="iconify:simple-icons/docker" selected=true >}}

```yaml {filename=".devcontainer/docker-compose.yml"}
    volumes:
      - ..:/workspaces/your-project:cached
      - type: bind
        source: ${HOME}/.ssh/id_ed25519_personal.pub
        target: /home/vscode/.ssh/id_ed25519_personal.pub
        read_only: true
      - type: bind
        source: ${HOME}/.ssh/known_hosts
        target: /home/vscode/.ssh/known_hosts
        read_only: true
```

{{< /tab >}}

{{< tab name="devcontainer.json" icon="iconify:codicon/vm" >}}

```json {filename=".devcontainer/devcontainer.json"}
  "mounts": [
    "source=${localEnv:HOME}/.ssh/id_ed25519_personal.pub,target=/home/vscode/.ssh/id_ed25519_personal.pub,type=bind,readonly",
    "source=${localEnv:HOME}/.ssh/known_hosts,target=/home/vscode/.ssh/known_hosts,type=bind,readonly"
  ]
```

{{< /tab >}}

{{< /tabs >}}

The trade-off is scope: `core.sshCommand` covers git and nothing else, so
`ssh -T github-personal` stops working as a check inside the container. Use
`git ls-remote` instead.

{{< callout type="info" >}}
Outside VS Code, the `devcontainer` CLI does not forward the agent for you:

```shell
--mount type=bind,source=${SSH_AUTH_SOCK},target=/ssh-agent \
--remote-env SSH_AUTH_SOCK=/ssh-agent
```

On macOS the socket is a launchd path that only resolves on the host, so the
bind is required — passing the variable through on its own is not enough.
{{< /callout >}}

### Check both halves

Quit VS Code **completely** and relaunch, then open a terminal in the container
and test each identity separately.

**The token**, which is what `gh` uses:

```shell
echo "${GH_TOKEN:+set}"
gh auth status
```

The first prints `set` or nothing, so you confirm it arrived without putting the
secret on screen. The second should name the personal account:

```text
github.com
  ✓ Logged in to github.com account you (GH_TOKEN)
  - Active account: true
  - Token: ghp_************************************
```

The parenthesis after the account name is the useful part. `GH_TOKEN` means it
picked up the environment variable; `keyring` or `oauth_token` means it found a
stored login instead, and you are about to act as the wrong account.

**The key**, which is what git uses — always through the alias:

```shell
ssh -T github-personal
```

```text
Hi you! You've successfully authenticated, but GitHub does not
provide shell access.
```

The name in the greeting is the account that key belongs to. If it is the wrong
one, check `git remote -v` — the remote has to use the alias, not
`git@github.com`.

{{< callout type="info" >}}
`ssh -T git@github.com` looks like the same test and is not. It asks "does *any*
key I am holding work", which is almost always yes, and the name it greets you
with is whichever key the agent happened to offer first — not the one your
remote will use. Always test the alias.
{{< /callout >}}

Finally, confirm the two are genuinely independent by checking git separately:

```shell
git remote -v
git config user.email
```

{{% /steps %}}

---

## Why not the simpler options

Each of these looks like it would work, and each fails in a way you notice
late.

{{< accordion mode="collapse" >}}

{{< accordion-item title="Just run gh auth login in the container" icon="x-circle" >}}
Fine once. Then you rebuild and the credentials are gone, so you repeat the
device-code dance every time. Persisting them in a volume leaves a live GitHub
credential with no rotation and no lifecycle.
{{< /accordion-item >}}

{{< accordion-item title="Put the token in a .env file" icon="x-circle" >}}
Plaintext, inside the working tree. `.gitignore` holds until someone runs
`git add -f`, or copies the folder, or the backup tool does its job. A secret in
the repo directory is a secret waiting to be committed.
{{< /accordion-item >}}

{{< accordion-item title="Use containerEnv instead of remoteEnv" icon="x-circle" >}}
`containerEnv` bakes the value into the container. It lands in `docker inspect`
and in whatever the extension writes under its `globalStorage`, and it is fixed
for the container's life — rotating the token means a full rebuild. `remoteEnv`
keeps the value out of the container's configuration entirely.
{{< /accordion-item >}}

{{< accordion-item title="Export GH_TOKEN on the host" icon="x-circle" >}}
The subtle one. `gh` prefers `GH_TOKEN` over stored credentials, so every
terminal on your machine silently becomes the personal account. You find out
weeks later when a work issue is filed under the wrong name.
{{< /accordion-item >}}

{{< accordion-item title="Mount ~/.config/gh into the container" icon="x-circle" >}}
That is the host's `gh` login — the work account. Sharing it into the container
gives you one identity in two places, which is the exact thing you set out to
avoid.
{{< /accordion-item >}}

{{< accordion-item title="Skip SSH and let gh handle git too" icon="question-mark-circle" >}}
Workable, not wrong. `gh auth setup-git` makes the token a git credential
helper, so git over HTTPS uses it as well. You trade a second credential for a
broader one: the token now covers pushes, and losing it costs more. Separate
paths keep the blast radius smaller.
{{< /accordion-item >}}

{{< /accordion >}}

## When GH_TOKEN comes back empty

{{< accordion mode="collapse" >}}

{{< accordion-item title="VS Code cached a stale environment" icon="refresh" >}}
The resolved environment is computed once per application session. *Reload
Window* does not redo it. *Rebuild Container* does not redo it. Quit VS Code
entirely and start it again.

This is the usual answer, and it is confusing precisely because everything on
disk looks right.
{{< /accordion-item >}}

{{< accordion-item title="The guard never fired" icon="question-mark-circle" >}}
Prove it instead of guessing. Add a probe to your shell rc:

```zsh
[[ -n $VSCODE_RESOLVING_ENVIRONMENT ]] && date >> /tmp/vscode-env-probe
```

Quit and relaunch VS Code, then check the file. A new line means the guard
fires and the lookup is at fault. No line means VS Code is not resolving your
shell at all, usually because it inherited the environment from the terminal
you launched it from. Remove the probe afterwards.
{{< /accordion-item >}}

{{< accordion-item title="The keyring is locked" icon="lock-closed" >}}
Linux only, and silent — `secret-tool lookup` exits successfully and prints
nothing. Check by hand:

```shell
secret-tool lookup service gh-token-personal | wc -c
```

Zero bytes where you know the secret exists means the keyring never unlocked.
Switch that machine to `pass`.
{{< /accordion-item >}}

{{< accordion-item title="The token expired" icon="calendar" >}}
`gh auth status` says so plainly. Rotate in place — all three store commands
are idempotent — then quit and relaunch VS Code so the environment is resolved
again.
{{< /accordion-item >}}

{{< accordion-item title="Git works but gh does not, or the reverse" icon="arrows-expand" >}}
Expected, and the useful clue. Git failing is an SSH problem: check
`ssh -T github-personal`, the remote URL, and that the host block has
`IdentitiesOnly yes`. `gh` failing is a token problem: check
`echo "${GH_TOKEN:+set}"` and what `gh auth status` names in parentheses. They
share nothing, so fix them separately.
{{< /accordion-item >}}

{{< /accordion >}}

## Platform summary

| | macOS | Ubuntu, graphical login | Ubuntu, headless |
| --- | --- | --- | --- |
| Store | login keychain | GNOME login keyring | GPG via `pass` |
| Write | `security add-generic-password` | `secret-tool store` | `pass insert` |
| Read | `security find-generic-password` | `secret-tool lookup` | `pass show` |
| Unlocked by | macOS login | PAM at sign-in | `gpg-agent`, once per boot |
| SSH passphrase persists via | `UseKeychain` | `gcr-ssh-agent` + keyring | agent lifetime only |

Everything else is identical on all three: the guard, the compose file, the
rename to `GH_TOKEN`, the read-only `~/.ssh` mount.

On Ubuntu, `UseKeychain` has no equivalent — that job moved to **gcr-ssh-agent**
when gnome-keyring 46 dropped its SSH support. Enable it once and passphrases
survive a reboot:

```shell
systemctl --user enable --now gcr-ssh-agent.socket
```

## Worth the setup

Two identities on one laptop, no overlap between them, and the patch goes
upstream the same afternoon you found the bug instead of waiting for a weekend
and a second machine.

The dev container is what makes it portable. Same repository, same config, the
Ubuntu box at home and the MacBook at work — and the only thing that differs is
one line in your shell profile.

## Limitations

This guide is GitHub-centric, and it is worth being precise about which half.

The SSH side is not GitHub-specific at all. Host aliases, `IdentitiesOnly`, the
forwarded agent — that works against GitLab, Gitea, or a self-hosted instance
with nothing more than a different `HostName`.

The token side is. `gh` only speaks to GitHub, and `GH_TOKEN` is its variable.
The pattern should carry over easily enough — `glab` reads `GITLAB_TOKEN`, and
everything else here stays put — but I have not run it that way yet, so I am
not going to write it up as though I had.

If I end up setting one of those up, I will extend this guide rather than start
a new one.
