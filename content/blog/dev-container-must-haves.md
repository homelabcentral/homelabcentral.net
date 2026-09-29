---
title: "Dev container must haves"
date: 2026-09-29
draft: false
authors:
  - name: Homelab Central
tags:
  - vscode
  - devcontainer
  - docker
  - setup
excludeSearch: false
# The excerpt shown on the blog card and on tag pages. The `<!--more-->` marker
# further down outranks front matter for Hugo's own `.Summary`, which is what
# feeds `<meta name="description">` and `og:description`, so this is card-only.
summary: "Five things every dev container should forward from the host: the timezone, your SSH key, a gh token, your Claude login, and a non-root user. Compatible with - devcontainer.json, docker-compose.yml and Dockerfile"
# Keeps every setup-style tab block on the page in step with the others.
tabs:
  sync: true
# `coverText` renders in the card cover slot with the prompt glyph from
# params.command.prompt until there is a real cover image.
coverText: |
  dev container must haves
---

{{< lead >}}
A robust dev container needs these from the host - timezone, git credentails, gh cli, code agent login/authentication, a non root user.
{{< /lead >}}

## The problem

A dev container gives you a clean, reproducible environment per project. But often overlooked are some things that are provided on the host for free.

{{% details title="Timezone" closed="true" %}}
A timezone is very important for the dev container, especially for logging. By default the timezone is Etc/UTC but that can be wrong since it is not yours or the projects correct timezone. While we ship the Dockerfile or mount the timezone in docker compose for deployed projects. We must also provide the dev container a timezone as well.
{{% /details %}}

{{% details title="Git Credentials" closed="true" %}}
Pass the same or different git credentials/ssh key to devcontainer to keep git working without a hiccup.
{{% /details %}}

{{% details title="Github CLI" closed="true" %}}
Github cli is essential for doing operations on github. While the host can authenticate the cli using auth, a better option for a dev container is to use a fine-granined PAT (personalized access token) that is scoped only with the necessary privilages to perform certain operations on github. This PAT lives on the host and is only requeted when necessary.
{{% /details %}}

{{% details title="Claude Code/AI coding agent" closed="true" %}}
If you are using any other AI coding agent other than github copilot. Authenticating for each dev container or every time you rebuild becomes a chore. So, use a token forwarding to authenticate the same coding agent inside the dev container as well.
{{% /details %}}

{{% details title="Non-root User" closed="true" %}}
Docker gives root access on host if a docker container runs as root. A better option is to run the dev container as a non-root user if you are not binding to any privilaged ports.
{{% /details %}}
<!--more-->

## The five

{{< cards cols="3" >}}
{{< card link="#timezone-forwarding" title="Timezone" icon="clock" subtitle="The container's clock, in your zone, so timestamps mean something." >}}
{{< card link="#ssh-forwarding" title="SSH" icon="key" subtitle="git push works, and your private keys never enter the container." >}}
{{< card link="#gh-cli-forwarding" title="gh CLI" icon="github" subtitle="A scoped token per project, read from the host's secret store." >}}
{{< card link="#claude-forwarding" title="Claude" icon="sparkles" subtitle="Sign in once, not once per container per rebuild." >}}
{{< card link="#run-as-a-user-not-root" title="Non-root user" icon="user-circle" subtitle="Files you create stay yours, on both sides of the mount." >}}
{{< /cards >}}

## The example, and the three ways to build it

There are three shapes a dev container comes in, and every snippet below is
given in all three. Pick your shape once and read only that tab for the rest of
the page — the tabs stay in sync.

{{< cards cols="3" >}}
{{< card title="devcontainer.json" icon="document-text" subtitle="One file, one image. Nothing else." >}}
{{< card title="+ docker-compose.yml" icon="cube" subtitle="Several services — a database, a cache — alongside the dev one." >}}
{{< card title="+ Dockerfile" icon="terminal" subtitle="You need packages baked in, so the image is yours." >}}
{{< /cards >}}

Every example uses the same project, the same service name and the same user,
so the parts compose instead of contradicting each other:

{{< filetree/container >}}
{{< filetree/folder name="your-project" >}}
{{< filetree/folder name=".devcontainer" >}}
{{< filetree/file name="devcontainer.json" >}}
{{< filetree/file name="docker-compose.yml" >}}
{{< filetree/file name="Dockerfile" >}}
{{< /filetree/folder >}}
{{< filetree/file name="README.md" >}}
{{< /filetree/folder >}}
{{< /filetree/container >}}

{{< borderless-table >}}
| Thing   | Value          | Used as                                 |
| ------- | -------------- | --------------------------------------- |
| Project | `your-project` | workspace folder name                   |
| Service | `dev`          | the compose service VS Code attaches to |
| User    | `vscode`       | uid 1000 in the Microsoft base images   |
| Home    | `/home/vscode` | every mount target below                |
{{< /borderless-table >}}

{{< callout type="info" >}}
Three host variables carry everything across. Two are set unconditionally,
one only while VS Code is looking:

- `HOST_TZ` — the host's IANA timezone. Not a secret.
- `PROJECT_GH_TOKEN` — a GitHub token, scoped to this project.
- `PROJECT_CLAUDE_TOKEN` — a Claude Code OAuth token, if you go that route.

Rename the last two per project. That is the whole point of them.
{{< /callout >}}

---

## 1. Timezone forwarding

A container image ships as UTC. Nothing warns you: the clock is simply wrong by
however far you are from Greenwich, and everything the container writes
inherits it — commit author dates, log lines, generated front matter, the
filenames of anything you name after the time.

Two ways to fix it.

{{< borderless-table >}}
| Approach                    | What it does                                         | Best for                                |
| --------------------------- | ---------------------------------------------------- | --------------------------------------- |
| Bind-mount | Container reads the host's zoneinfo file `/etc/localtime` directly   | Linux hosts                             |
| Export an IANA zone name    | Container gets `TZ=Europe/London` in its environment | Everywhere, including macOS and Windows |
{{< /borderless-table >}}

The mount is shorter to write. The variable is the one that works on every
host, because on macOS and Windows the Docker daemon runs inside its own Linux
VM and `/etc/localtime` is the VM's file, not your laptop's.

{{< callout type="info" >}}
A timezone is not a credential. Export it unconditionally in your shell
profile — no `VSCODE_RESOLVING_ENVIRONMENT` guard, no secret store, one
variable shared by every container on the machine.

The exception is a project that must run in a zone other than yours — a
reproduction of a production incident in UTC, a team in another country. Give
that one its own variable name, `PROJECT_TZ`, and set it per project rather
than bending `HOST_TZ` to fit.

For a team project, if you must use a specific timezone. You can also always just hardcode it.
{{< /callout >}}

### Export an IANA zone name

Exporing the IANA zone name if the preffered method.

{{% steps %}}

### Read the host's zone

The answer is an IANA name — `Europe/London`, `America/New_York`. Not an
abbreviation like `BST`, which is ambiguous and which `tzdata` will reject.

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

```shell
readlink /etc/localtime
```

```text
/var/db/timezone/zoneinfo/Europe/London
```

The zone is everything after `zoneinfo/`.

{{< /tab >}}

{{< tab name="Ubuntu" icon="iconify:bi/ubuntu" >}}

```shell
timedatectl show -p Timezone --value
```

```text
Europe/London
```

{{< /tab >}}

{{< /tabs >}}

### Export it from your shell profile

Strip the prefix in the shell rather than hardcoding the name, so the variable
follows you when you travel or when the machine changes zone.

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

```zsh {filename="~/.zshrc"}
export HOST_TZ="${$(readlink /etc/localtime)##*/zoneinfo/}"
```

{{< /tab >}}

{{< tab name="Ubuntu" icon="iconify:bi/ubuntu" >}}

```zsh {filename="~/.zshrc"}
export HOST_TZ="$(timedatectl show -p Timezone --value 2>/dev/null)"
```

{{< /tab >}}

{{< /tabs >}}

Open a new terminal and check it:

```shell
echo "$HOST_TZ"
```

{{< callout type="warning" >}}
Do not export bare `TZ` on the host. Every process you start would then read
your zone from a variable instead of from the system, which is the same value
until the day it is not — after a DST change, or after you fly somewhere, a
stale shell keeps the old one and `date` quietly lies to you.

`HOST_TZ` is inert on the host and only means something on the way into a
container.
{{< /callout >}}

### Pass it into the container

{{< tabs >}}

{{< tab name="devcontainer.json" icon="iconify:catppuccin/devcontainer" selected=true >}}

```json {filename=".devcontainer/devcontainer.json",hl_lines=[5,6,7]}
{
  "name": "your-project",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "remoteUser": "vscode",
  "containerEnv": {
    "TZ": "${localEnv:HOST_TZ}"
  }
}
```

`${localEnv:...}` reads the environment VS Code resolved from your login shell.
An unset variable becomes an empty string, and an empty `TZ` means UTC — the
same place you started, so a missing variable degrades rather than breaks.

Use `containerEnv` here, not `remoteEnv`. `containerEnv` is set on the
container itself, so a dev server, a `postCreateCommand` and a background job
all see it; `remoteEnv` only reaches the terminals and tasks VS Code starts,
which would leave half the container in UTC.

{{< /tab >}}

{{< tab name="docker-compose.yml" icon="iconify:simple-icons/docker" >}}

```yaml {filename=".devcontainer/docker-compose.yml",hl_lines=[6,7]}
services:
  dev:
    image: mcr.microsoft.com/devcontainers/base:ubuntu
    user: vscode
    command: sleep infinity
    environment:
      - TZ=${HOST_TZ:-Etc/UTC}
    volumes:
      - ..:/workspaces/your-project:cached
```

```json {filename=".devcontainer/devcontainer.json"}
{
  "name": "your-project",
  "dockerComposeFile": "docker-compose.yml",
  "service": "dev",
  "workspaceFolder": "/workspaces/your-project",
  "remoteUser": "vscode"
}
```

Compose reads `${...}` from the environment it is invoked with, which is the
one VS Code just resolved. Unlike `devcontainer.json`, compose has real default
syntax: `:-Etc/UTC` makes the fallback explicit instead of implied.

The other services in the file need the same line. A database logging in UTC
while your application logs in local time is a worse debugging experience than
both being wrong the same way.

{{< /tab >}}

{{< tab name="Dockerfile" icon="iconify:simple-icons/docker" >}}

A zone baked into an image is wrong for everyone who does not live in it, so
take it as a build argument with a sane default:

```dockerfile {filename=".devcontainer/Dockerfile",hl_lines=[3,4,10]}
FROM mcr.microsoft.com/devcontainers/base:ubuntu

ARG TZ=Etc/UTC
ENV TZ=${TZ}

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && apt-get install -y --no-install-recommends tzdata \
 && rm -rf /var/lib/apt/lists/*

RUN ln -snf "/usr/share/zoneinfo/${TZ}" /etc/localtime && echo "${TZ}" > /etc/timezone
```

Then pass the value at build time:

```json {filename=".devcontainer/devcontainer.json",hl_lines=[5]}
{
  "name": "your-project",
  "build": {
    "dockerfile": "Dockerfile",
    "args": { "TZ": "${localEnv:HOST_TZ}" }
  },
  "remoteUser": "vscode",
  "containerEnv": {
    "TZ": "${localEnv:HOST_TZ}"
  }
}
```

Or, with compose in front of it:

```yaml {filename=".devcontainer/docker-compose.yml",hl_lines=[5]}
services:
  dev:
    build:
      context: .
      args:
        TZ: ${HOST_TZ:-Etc/UTC}
    user: vscode
    command: sleep infinity
    environment:
      - TZ=${HOST_TZ:-Etc/UTC}
```

Keep both the build arg and the runtime variable. The arg decides what
`/etc/localtime` points at, which is what libraries that ignore `TZ` read; the
runtime variable decides what everything else reads, and it can change without
a rebuild of the image layers.

{{< callout type="error" >}}
`DEBIAN_FRONTEND=noninteractive` is not optional on that `apt-get`. Installing
`tzdata` interactively prompts for a region, and in a build there is nobody to
answer — the build hangs until it times out, with no error that names the
cause.
{{< /callout >}}

{{< /tab >}}

{{< /tabs >}}

### Verify

Rebuild, open a terminal in the container:

```shell
date
echo "$TZ"
```

The date should match the clock on your host, to the minute.

{{% /steps %}}

{{< callout type="warning" >}}
`TZ` is read once, when a process starts. Changing it needs a rebuild, or at
minimum a new terminal — _Reload Window_ will not move the clock of anything
already running.
{{< /callout >}}

{{% details title="The bind-mount route, if you are on Linux" closed="true" %}}

On a Linux host the daemon shares the host's kernel and filesystem, so
`/etc/localtime` really is the file you think it is:

```json {filename=".devcontainer/devcontainer.json"}
  "mounts": [
    "source=/etc/localtime,target=/etc/localtime,type=bind,readonly",
    "source=/etc/timezone,target=/etc/timezone,type=bind,readonly"
  ]
```

```yaml {filename=".devcontainer/docker-compose.yml"}
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /etc/timezone:/etc/timezone:ro
```

Mount both. `/etc/localtime` is the binary zoneinfo that C programs read;
`/etc/timezone` is the plain-text name that Debian tooling and some runtimes
read instead, and a container with only the first will tell you the right time
under the wrong name.

It has one real advantage over the variable: change the host's zone and the
container follows on its next start, with nothing to re-export.

It also has one real limitation, which is why it is not the main route above.
On macOS and on Windows the path is resolved inside Docker's Linux VM, so you
either mount the VM's UTC file over your container's UTC file, or the bind
fails outright because the source does not exist. Neither is what you wanted.
{{% /details %}}

---

## 2. SSH forwarding

Inside the container, `git push` is an SSH connection like any other, and it
needs a key. There are two honest ways to give it one, and they are not the
same trade.

{{< borderless-table >}}
| Approach          | What crosses the boundary           | Cost                                  |
| ----------------- | ----------------------------------- | ------------------------------------- |
| Forward the agent | Nothing. The host signs on request. | The agent must already hold the key   |
| Mount the key     | The key file itself                 | Anything in the container can read it |
{{< /borderless-table >}}

Forwarding is the default and the better one: VS Code binds the host's
`SSH_AUTH_SOCK` into the container automatically, and the container never holds
key material — it hands a challenge to the host agent and gets a signature
back. Your private key does not move.

The catch is the first four words of that sentence. The agent signs with what
it is holding, and an agent that was never given your key holds nothing. That
is what the lazy load below is for.

### Load the key lazily, on the host

Adding every key to the agent at login defeats the passphrase. Adding none
means the container fails. So add exactly the key this machine's dev containers
need, at exactly the moment VS Code asks for an environment:

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

```zsh {filename="~/.zshrc"}
if [[ -n $VSCODE_RESOLVING_ENVIRONMENT ]]; then
  key=~/.ssh/id_ed25519_project
  fp="$(ssh-keygen -lf "$key.pub" 2>/dev/null | awk '{print $2}')"
  if [[ -n $fp ]] && ! ssh-add -l 2>/dev/null | grep -q "$fp"; then
    ssh-add --apple-use-keychain "$key" >/dev/null 2>&1
  fi
  unset key fp
fi
```

`--apple-use-keychain` reads the passphrase from the login keychain, so nothing
prompts. It has to have been stored once, interactively:

```shell
ssh-add --apple-use-keychain ~/.ssh/id_ed25519_project
```

{{< /tab >}}

{{< tab name="Ubuntu" icon="iconify:bi/ubuntu" >}}

```zsh {filename="~/.zshrc"}
if [[ -n $VSCODE_RESOLVING_ENVIRONMENT ]]; then
  key=~/.ssh/id_ed25519_project
  fp="$(ssh-keygen -lf "$key.pub" 2>/dev/null | awk '{print $2}')"
  if [[ -n $fp ]] && ! ssh-add -l 2>/dev/null | grep -q "$fp"; then
    ssh-add "$key" >/dev/null 2>&1 </dev/null
  fi
  unset key fp
fi
```

There is no `--apple-use-keychain` here. The equivalent is **gcr-ssh-agent**,
which took over SSH duty when gnome-keyring 46 dropped it — enable it once and
a passphrase you have entered survives a reboot:

```shell
systemctl --user enable --now gcr-ssh-agent.socket
```

The `</dev/null` matters: without it, a key that still wants a passphrase makes
`ssh-add` sit waiting on a stdin that will never arrive, and VS Code's
environment resolution times out instead of failing fast.

{{< /tab >}}

{{< /tabs >}}

Two constraints shape that snippet. It runs inside VS Code's environment
resolution, which has a **ten second budget** before VS Code gives up with
_"Unable to resolve your shell environment in a reasonable time"_ — so it
checks the fingerprint first and does nothing on the common path. And anything
written to stderr during resolution can corrupt what VS Code parses back, hence
the redirections.

{{< callout type="important" >}}
**The trap that costs the most time.** VS Code resolves your shell environment
**once per application session**. _Reload Window_ does not redo it. _Rebuild
Container_ does not redo it. So you add the snippet, rebuild, and the key — or
the `gh` token in the next section — is still missing, with every file on disk
looking correct.

The fix is mechanical:

1. Quit VS Code **completely**. `Cmd`+`Q` on macOS, _File → Exit_ elsewhere.
   Closing the window is not quitting.
2. Wait a minute or two. The extension host and the running containers take a
   moment to actually go away.
3. Open VS Code from **Spotlight or the app launcher** — not from `code .` in a
   terminal. Launched from a terminal it inherits that terminal's environment
   instead of resolving a fresh one, and a terminal you opened before editing
   `~/.zshrc` has none of your changes.
4. Now _Rebuild Container_.
{{< /callout >}}

### Wire it into the container

{{% steps %}}

### Give ssh a config it can resolve

The agent may hold more than one key. With nothing to choose by, ssh offers
them in the agent's order and the server accepts the first that matches — which
may be the wrong account, and you will not notice, because the connection
succeeds.

Put the choice in the repository, where it is a property of the container
rather than of whichever laptop you opened it on:

```sshconfig {filename=".devcontainer/ssh-config"}
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_container.pub
  IdentitiesOnly yes
```

`IdentityFile` pointing at a **public** key is not a typo. The private half is
in the forwarded agent; ssh uses the public key only to decide which agent
identity to offer, and the agent does the signing. `IdentitiesOnly yes` is what
makes the line binding instead of a suggestion.

### Mount the public half and link the config

Nothing secret crosses here — a `.pub` file is public by definition.

{{< tabs >}}

{{< tab name="devcontainer.json" icon="iconify:catppuccin/devcontainer" selected=true >}}

```json {filename=".devcontainer/devcontainer.json"}
  "mounts": [
    "source=${localEnv:HOME}/.ssh/id_ed25519_project.pub,target=/home/vscode/.ssh/id_container.pub,type=bind,readonly"
  ],
  "postCreateCommand": "ln -sfn \"${containerWorkspaceFolder}/.devcontainer/ssh-config\" /home/vscode/.ssh/config"
```

{{< /tab >}}

{{< tab name="docker-compose.yml" icon="iconify:simple-icons/docker" >}}

```yaml {filename=".devcontainer/docker-compose.yml"}
services:
  dev:
    volumes:
      - ..:/workspaces/your-project:cached
      - ssh_home:/home/vscode/.ssh
      - type: bind
        source: ${HOME}/.ssh/id_ed25519_project.pub
        target: /home/vscode/.ssh/id_container.pub
        read_only: true

volumes:
  ssh_home:
```

```json {filename=".devcontainer/devcontainer.json"}
  "postCreateCommand": "sudo chown \"$(id -u):$(id -g)\" /home/vscode/.ssh && sudo chmod 700 /home/vscode/.ssh && ln -sfn \"${containerWorkspaceFolder}/.devcontainer/ssh-config\" /home/vscode/.ssh/config"
```

A named volume for `~/.ssh` keeps `known_hosts` across rebuilds, so you are not
re-confirming GitHub's host key every time. Docker creates that volume
root-owned, which is what the `chown` is for — non-recursive, because the key
mounted inside it is read-only.

{{< callout type="error" >}}
Write the bind in **long syntax**, not as a `source=...,target=...` string. On
the compose code path the dev containers CLI uses, a mount string's `readonly`
flag is silently dropped. `read_only: true` under long syntax survives.
{{< /callout >}}

{{< /tab >}}

{{< tab name="Dockerfile" icon="iconify:simple-icons/docker" >}}

The Dockerfile's only job here is to make sure the directory exists with the
right ownership before anything is mounted into it:

```dockerfile {filename=".devcontainer/Dockerfile"}
USER vscode
RUN mkdir -p /home/vscode/.ssh && chmod 700 /home/vscode/.ssh
```

The mount and the symlink stay in `devcontainer.json` or `docker-compose.yml`
exactly as in the other two tabs. A key baked into an image is a key in a layer
that gets pushed to a registry, so there is nothing else for the Dockerfile to
do.

{{< callout type="warning" >}}
`ssh` refuses to read a config or a key directory that is group- or
world-writable, and says so with `Bad owner or permissions` — which looks
nothing like a key problem. `chmod 700` on `~/.ssh` is the fix, and it has to
survive whatever gets mounted over it.
{{< /callout >}}

{{< /tab >}}

{{< /tabs >}}

### Verify

Inside the container:

```shell
ssh-add -l
ssh -T git@github.com
```

The first lists what the forwarded agent is holding — empty output means the
host never loaded the key, so go back to the shell profile, and quit VS Code
properly. The second should greet you by name:

```text
Hi you! You've successfully authenticated, but GitHub does not
provide shell access.
```

{{% /steps %}}

{{% details title="If you would rather mount the key than forward the agent" closed="true" %}}

Sometimes there is no agent to forward: a Codespace, a CI runner, a headless
box you reach over Remote SSH. Mount the private half instead, read-only, and
generate a key used for nothing else so the blast radius is one project:

```json {filename=".devcontainer/devcontainer.json"}
  "mounts": [
    "source=${localEnv:HOME}/.ssh/id_ed25519_project,target=/home/vscode/.ssh/id_container,type=bind,readonly",
    "source=${localEnv:HOME}/.ssh/id_ed25519_project.pub,target=/home/vscode/.ssh/id_container.pub,type=bind,readonly"
  ]
```

Point `IdentityFile` at `~/.ssh/id_container` — the private one — in the ssh
config, and give the key **no passphrase**, because there is nothing in the
container to type one into.

Understand what you traded. Any process in that container, including a
dependency's install script, can read the key and copy it out. Mount exactly
one key, use it for exactly one thing, and be able to revoke it without
touching anything else.

{{% /details %}}

---

## 3. Github CLI forwarding

VS Code has its own GitHub sign-in, and inside a dev container it is not
reliably the thing `gh` reads. The account picker signs the _editor_ in; `gh` in
a container terminal looks for `GH_TOKEN`, then for credentials in
`~/.config/gh`, and finds neither.

Running `gh auth login` inside the container fixes it exactly until the next
rebuild, and persisting that login in a volume leaves a live GitHub credential
with no expiry and no rotation.

A scoped personal access token in the host's secret store is better on every
axis. It is per project, so a leak is bounded. It expires on a date you chose.
And it is looked up at the moment VS Code needs it, so it is never written to a
file in the repository.

The real payoff is that a token is just a variable name. You can hold several:

{{< borderless-table >}}
| Host variable      | Token owner      | Used by                                  |
| ------------------ | ---------------- | ---------------------------------------- |
| `WORK_GH_TOKEN`    | work account     | the work monorepo's container            |
| `PROJECT_GH_TOKEN` | personal account | an open source project you contribute to |
{{< /borderless-table >}}

Which means you can be on the work laptop, in a container for an upstream
project, acting as your personal self — pushing with a personal SSH key and
opening the pull request with a personal token — while the host's own `gh`
stays signed in for work and never notices.

{{% steps %}}

### Create the token

Sign in as the account that should own it, then
[github.com/settings/personal-access-tokens/new](https://github.com/settings/personal-access-tokens/new).

{{< borderless-table >}}
| Field             | Value                                              |
| ----------------- | -------------------------------------------------- |
| Resource owner    | the account that **owns the repository**           |
| Repository access | **Only select repositories** — name this project's |
| Expiration        | 90 days, or something you will actually notice     |
{{< /borderless-table >}}

{{< borderless-table >}}
| Permission    | Level          | Needed for                                |
| ------------- | -------------- | ----------------------------------------- |
| Metadata      | Read-only      | mandatory, granted automatically          |
| Contents      | Read and write | reading files through the API, releases   |
| Pull requests | Read and write | `gh pr create`, `gh pr merge`             |
| Issues        | Read and write | `gh issue` — skip it if you do not use it |
| Workflows     | Read and write | only if you edit `.github/workflows/`     |

{{< /borderless-table >}}

Copy the value. GitHub shows it once.

{{< callout type="warning" >}}
A fine-grained token can only act on repositories owned by its **resource
owner**. Opening a pull request against someone else's project is a call
against _their_ repository, so a fine-grained token has no reach there and
`gh pr create` fails with `Resource not accessible by personal access token`.
Contributing upstream through a fork needs a **classic** token with
`public_repo`.

The full version of that, including the two-identity setup this section is a
condensed form of, is in
[git and gh CLI in a dev container](/blog/git-and-gh-cli-in-a-dev-container/).
{{< /callout >}}

### Store it in the host's secret store

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

```shell
security add-generic-password -a project -s gh-token-project -U -w
```

Leave `-w` bare and last. `security` then prompts for the value instead of
taking it as an argument, so the token never lands in your shell history or in
the process table. `-U` updates an existing item, which is what rotation needs.

{{< /tab >}}

{{< tab name="Ubuntu" icon="iconify:bi/ubuntu" >}}

```shell
sudo apt install libsecret-tools
secret-tool store --label='gh-token-project' account project service gh-token-project
```

`account` and `service` are not reserved names — libsecret attributes are
arbitrary pairs you invent. Lookup matches exact strings, so a typo returns
empty rather than an error.

On a headless box or WSL there is no unlocked login keyring and `secret-tool`
returns nothing, silently. Use `pass` there instead: `pass insert
project/gh-token`.

{{< /tab >}}

{{< /tabs >}}

### Export it, gated

Unlike the timezone, this one is a credential, so it exists only in the
transient shell VS Code spawns to read your environment:

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

```zsh {filename="~/.zshrc"}
if [[ -n $VSCODE_RESOLVING_ENVIRONMENT ]]; then
  export PROJECT_GH_TOKEN="$(security find-generic-password \
    -a project -s gh-token-project -w 2>/dev/null)"
fi
```

{{< /tab >}}

{{< tab name="Ubuntu" icon="iconify:bi/ubuntu" >}}

```zsh {filename="~/.zshrc"}
if [[ -n $VSCODE_RESOLVING_ENVIRONMENT ]]; then
  export PROJECT_GH_TOKEN="$(secret-tool lookup \
    account project service gh-token-project 2>/dev/null)"
fi
```

{{< /tab >}}

{{< /tabs >}}

{{< callout type="error" >}}
Never export it as `GH_TOKEN` on the host. `gh` prefers `GH_TOKEN` over its
stored credentials, so every terminal on your machine would silently become
that account. You find out weeks later, when a work issue has been filed under
the wrong name.

The rename to `GH_TOKEN` happens on the way _into_ the container and nowhere
else.
{{< /callout >}}

### Pass it in as GH_TOKEN

{{< tabs >}}

{{< tab name="devcontainer.json" icon="iconify:catppuccin/devcontainer" selected=true >}}

```json {filename=".devcontainer/devcontainer.json",hl_lines=[2]}
  "remoteEnv": {
    "GH_TOKEN": "${localEnv:PROJECT_GH_TOKEN}"
  }
```

{{< /tab >}}

{{< tab name="docker-compose.yml" icon="iconify:simple-icons/docker" >}}

```yaml {filename=".devcontainer/docker-compose.yml",hl_lines=[3]}
    environment:
      - TZ=${HOST_TZ:-Etc/UTC}
      - GH_TOKEN=${PROJECT_GH_TOKEN:-}
```

`:-` supplies an empty default, so an unset variable is quiet rather than
fatal — `gh` is simply unauthenticated then.

{{< /tab >}}

{{< tab name="Dockerfile" icon="iconify:simple-icons/docker" >}}

Nothing. A token in a Dockerfile is a token in an image layer, and image layers
get pushed, cached and shared. Install the CLI here if the base image lacks it,
and let the environment carry the credential:

```dockerfile {filename=".devcontainer/Dockerfile"}
USER root
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && apt-get install -y --no-install-recommends gh \
 && rm -rf /var/lib/apt/lists/*
USER vscode
```

The Microsoft base images already ship `gh`, so this is only for a
`FROM ubuntu:24.04` of your own.

{{< /tab >}}

{{< /tabs >}}

{{< callout type="info" >}}
Use `remoteEnv` for the token, `containerEnv` for the timezone. `containerEnv`
bakes the value into the container: it shows up in `docker inspect`, and it is
fixed until you rebuild, so a rotated token means a full rebuild. `remoteEnv`
is applied by VS Code to terminals, tasks and debug sessions, so nothing is
stored in the container's configuration.
{{< /callout >}}

### Verify

```shell
echo "${GH_TOKEN:+set}"
gh auth status
```

The first prints `set` or nothing, so you confirm it arrived without putting
the secret on screen. The second names the account and, in parentheses, where
the credential came from:

```text
github.com
  ✓ Logged in to github.com account you (GH_TOKEN)
```

`GH_TOKEN` in the parentheses is what you want. `keyring` or `oauth_token`
means it found a stored login instead, and you are about to act as the wrong
account.

{{% /steps %}}

---

## 4. Claude forwarding

The era of AI coding agents is here, whether you like it or not. And unless
yours is GitHub Copilot — which rides VS Code's own sign-in — you will be
authenticating again on every rebuild, and again in every other project's
container.

Claude Code keeps its state in two places, and that split is the reason most
attempts at fixing this fail:

{{< borderless-table >}}
| Path             | Holds                                                      |
| ---------------- | ---------------------------------------------------------- |
| `~/.claude/`     | settings, commands, agents, history                        |
| `~/.claude.json` | the OAuth account, personal MCP servers, per-project trust |
{{< /borderless-table >}}

Persist the directory and not the file, and you will still be logged out on
every rebuild while everything looks like it should have worked.

`CLAUDE_CONFIG_DIR` is what closes the gap: point it at the mounted path and
Claude Code writes _both_ inside it. That single variable is the piece people
miss.

Three ways to go, and they differ only in what you are willing to expose.

{{< borderless-table >}}
|                                  | Shares credentials     | Survives rebuild | Container can read your host login |
| -------------------------------- | ---------------------- | ---------------- | ---------------------------------- |
| **A** — bind-mount `~/.claude`   | across every container | yes              | yes                                |
| **B** — named volume per project | no                     | yes              | no                                 |
| **C** — long-lived token         | across every container | yes              | no                                 |
{{< /borderless-table >}}

### Option A — one login shared by every container

The simplest, and the right default when every container you run holds your own
code.

{{< tabs >}}

{{< tab name="devcontainer.json" icon="iconify:catppuccin/devcontainer" selected=true >}}

```json {filename=".devcontainer/devcontainer.json",hl_lines=[3,6]}
{
  "mounts": [
    "source=${localEnv:HOME}/.claude,target=/home/vscode/.claude,type=bind"
  ],
  "containerEnv": {
    "CLAUDE_CONFIG_DIR": "/home/vscode/.claude"
  }
}
```

{{< /tab >}}

{{< tab name="docker-compose.yml" icon="iconify:simple-icons/docker" >}}

```yaml {filename=".devcontainer/docker-compose.yml",hl_lines=[4,8]}
services:
  dev:
    environment:
      - CLAUDE_CONFIG_DIR=/home/vscode/.claude
    volumes:
      - type: bind
        source: ${HOME}/.claude
        target: /home/vscode/.claude
```

No `read_only` on this one — Claude Code writes to it, which is the entire
point.

{{< /tab >}}

{{< tab name="Dockerfile" icon="iconify:simple-icons/docker" >}}

Install the CLI in the image, and leave the credentials to the mount:

```dockerfile {filename=".devcontainer/Dockerfile"}
USER vscode
ENV CLAUDE_CONFIG_DIR=/home/vscode/.claude
RUN curl -fsSL https://claude.com/install.sh | bash
```

The mount itself still belongs in `devcontainer.json` or `docker-compose.yml`.
Anything you `COPY` into an image is in the image, and an image with your OAuth
credentials in it is one `docker push` away from being someone else's.

{{< /tab >}}

{{< /tabs >}}

Replace `/home/vscode` with whatever `remoteUser`'s home directory actually is.
Microsoft's base images use `vscode`; the Node ones use `node`. Rebuild once,
sign in once, and every container carrying this mount is signed in from then
on.

### Option B — persistent, but isolated per project

Same durability, no sharing. A named volume keyed to the container survives
rebuilds without ever touching your host's credentials:

{{< tabs >}}

{{< tab name="devcontainer.json" icon="iconify:catppuccin/devcontainer" selected=true >}}

```json {filename=".devcontainer/devcontainer.json"}
{
  "mounts": [
    "source=claude-code-config-${devcontainerId},target=/home/vscode/.claude,type=volume"
  ],
  "containerEnv": {
    "CLAUDE_CONFIG_DIR": "/home/vscode/.claude"
  },
  "postCreateCommand": "sudo chown -R vscode:vscode /home/vscode/.claude"
}
```

`${devcontainerId}` is a stable identifier for this dev container, so the volume
name is unique per project and constant across rebuilds.

{{< /tab >}}

{{< tab name="docker-compose.yml" icon="iconify:simple-icons/docker" >}}

```yaml {filename=".devcontainer/docker-compose.yml"}
services:
  dev:
    environment:
      - CLAUDE_CONFIG_DIR=/home/vscode/.claude
    volumes:
      - claude_config:/home/vscode/.claude

volumes:
  claude_config:
```

Compose scopes volume names to the project already, so there is no
`${devcontainerId}` to add. Keep the `chown` in `postCreateCommand`.

{{< /tab >}}

{{< tab name="Dockerfile" icon="iconify:simple-icons/docker" >}}

Identical to Option A — install the CLI, set `CLAUDE_CONFIG_DIR`, and let the
volume carry the state:

```dockerfile {filename=".devcontainer/Dockerfile"}
USER vscode
ENV CLAUDE_CONFIG_DIR=/home/vscode/.claude
RUN curl -fsSL https://claude.com/install.sh | bash
```

{{< /tab >}}

{{< /tabs >}}

{{< callout type="warning" >}}
Docker creates a named volume root-owned. Without the `chown`, Claude Code
cannot write its config and fails in a way that reads like a login problem
rather than a permissions one.
{{< /callout >}}

You authenticate once per project instead of once per machine. Rebuilds are
free.

### Option C — skip the login flow entirely

If you would rather mount no credentials at all, generate a long-lived token on
the host and pass it in as a variable, exactly like the `gh` token above.

{{% steps %}}

### Generate the token, once, on the host

On the machine with a browser, where you are already signed in:

```shell
claude setup-token
```

The same OAuth flow opens, and the terminal prints a token:

```text
sk-ant-oat01-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

{{< callout type="important" >}}
Claude Code does **not** save this anywhere. That printout is the only time you
see it — copy it into your password manager or secret store immediately.

It lasts a year, requires a Pro, Max, Team or Enterprise subscription, and can
only make model requests: no Remote Control sessions, no claude.ai connectors.
MCP servers you configure locally in a project still work.
{{< /callout >}}

### Store it where the container can reach it

Not in `devcontainer.json` — that file is committed. The options, roughly in
order of convenience against safety:

{{< borderless-table >}}
| Where                              | Notes                                              |
| ---------------------------------- | -------------------------------------------------- |
| Host secret store                  | Same pattern as the `gh` token. Best default.      |
| A gitignored `.env`, via `envFile` | Plaintext in the working tree. Workable, not good. |
| A secrets manager or vault         | No plaintext on disk at all.                       |
| A Codespaces secret                | Exposed as an environment variable automatically.  |
{{< /borderless-table >}}

Reuse the machinery you already built:

```zsh {filename="~/.zshrc"}
if [[ -n $VSCODE_RESOLVING_ENVIRONMENT ]]; then
  export PROJECT_CLAUDE_TOKEN="$(security find-generic-password \
    -a project -s claude-token-project -w 2>/dev/null)"
fi
```

### Pass it in

{{< tabs >}}

{{< tab name="devcontainer.json" icon="iconify:catppuccin/devcontainer" selected=true >}}

```json {filename=".devcontainer/devcontainer.json"}
  "remoteEnv": {
    "CLAUDE_CODE_OAUTH_TOKEN": "${localEnv:PROJECT_CLAUDE_TOKEN}"
  }
```

{{< /tab >}}

{{< tab name="docker-compose.yml" icon="iconify:simple-icons/docker" >}}

```yaml {filename=".devcontainer/docker-compose.yml"}
    environment:
      - CLAUDE_CODE_OAUTH_TOKEN=${PROJECT_CLAUDE_TOKEN:-}
```

{{< /tab >}}

{{< tab name="Dockerfile" icon="iconify:simple-icons/docker" >}}

Nothing, for the same reason as the `gh` token. `ARG` values are visible in
`docker history`; `ENV` values are visible in `docker inspect`. Credentials go
in at run time or not at all.

{{< /tab >}}

{{< /tabs >}}

### Verify

Rebuild, open a terminal in the container, and start it:

```shell
claude
```

It should come up already authenticated, with no browser prompt. `/status`
inside Claude Code names which credential source is active.

{{% /steps %}}

{{< callout type="warning" >}}
Four things to know about the token route.

**Precedence.** `CLAUDE_CODE_OAUTH_TOKEN` is checked before your subscription's
`/login` credentials, but _after_ `ANTHROPIC_API_KEY`, `ANTHROPIC_AUTH_TOKEN`
and `apiKeyHelper`. If your image or your shell also sets `ANTHROPIC_API_KEY`,
that wins, and you are billed on API credits instead of your subscription.
`unset ANTHROPIC_API_KEY` if that happens.

**Bare mode.** Claude Code launched with `--bare` does not read
`CLAUDE_CODE_OAUTH_TOKEN` at all. Those setups need `ANTHROPIC_API_KEY` or an
`apiKeyHelper`.

**Expiry.** One year. Re-run `claude setup-token` and update wherever you
stored it.

**Blast radius.** It is a standing credential with full access to your
subscription, in every container you drop it into.
{{< /callout >}}

{{< callout type="error" >}}
Whichever option you pick, a dev container is **not** a security boundary for
this. Run with `--dangerously-skip-permissions` and nothing stops a malicious
project from reading anything reachable inside the container — including
`~/.claude` and anything in the environment.

So: Option A for your own code. Option B or C for anything third-party, and a
token you can revoke without touching your host login. The
[Claude Code dev container docs](https://docs.claude.com/en/docs/claude-code/devcontainer)
are explicit about this, and worth reading before you mount your real
credentials into a stranger's repository.
{{< /callout >}}

---

## 5. Run as a user, not root

Docker runs as `root` unless told otherwise, and a dev container inherits that.
It works, and it costs you in two ways.

The visible one is ownership. Your workspace is a bind mount, so a file the
container creates as `root` is owned by `root` on the host too. On Linux you
then cannot edit your own source file without `sudo`, and `git status` starts
reporting changes you did not make.

The invisible one is everything a compromised dependency can do with `root` in
a container that has your SSH key and your tokens in it.

The only real argument for `root` is binding a port below 1024. If this is a
hobby project, or anything where you choose the ports, use 8080 or 8043 and the
argument goes away.

{{% steps %}}

### Pick the user

The Microsoft base images already ship a `vscode` user at uid 1000 with
passwordless `sudo`, so on those there is nobody to create — you just have to
say so.

{{< tabs >}}

{{< tab name="devcontainer.json" icon="iconify:catppuccin/devcontainer" selected=true >}}

```json {filename=".devcontainer/devcontainer.json",hl_lines=[4,5,6]}
{
  "name": "your-project",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "containerUser": "vscode",
  "remoteUser": "vscode",
  "updateRemoteUserUID": true
}
```

Both keys, because they are different jobs:

{{< borderless-table >}}
| Key             | Who it sets                                           |
| --------------- | ----------------------------------------------------- |
| `containerUser` | the user the container process itself runs as         |
| `remoteUser`    | the user VS Code's server, terminals and tasks run as |
{{< /borderless-table >}}

Set only `remoteUser` and the container's own entrypoint, plus anything started
outside VS Code, is still `root`.

`updateRemoteUserUID` defaults to `true` and is the one that makes ownership
come out right on Linux: it rewrites the container user's uid and gid to match
yours on the host, so files created on either side belong to the same person.
It is a no-op on macOS and Windows, where the file sharing layer already
translates ownership.

{{< /tab >}}

{{< tab name="docker-compose.yml" icon="iconify:simple-icons/docker" >}}

```yaml {filename=".devcontainer/docker-compose.yml",hl_lines=[4]}
services:
  dev:
    image: mcr.microsoft.com/devcontainers/base:ubuntu
    user: vscode
    command: sleep infinity
    volumes:
      - ..:/workspaces/your-project:cached
```

```json {filename=".devcontainer/devcontainer.json",hl_lines=[6]}
{
  "name": "your-project",
  "dockerComposeFile": "docker-compose.yml",
  "service": "dev",
  "workspaceFolder": "/workspaces/your-project",
  "remoteUser": "vscode"
}
```

`user:` in compose is `containerUser`'s equivalent; `remoteUser` stays in
`devcontainer.json`. You need both here too.

{{< callout type="warning" >}}
`updateRemoteUserUID` cannot help a compose service. Rewriting the uid means
rebuilding the image, and compose owns the image lifecycle. On a Linux host
where your uid is not 1000, set it explicitly in the Dockerfile — the next tab
shows how — or you are back to files owned by the wrong person.
{{< /callout >}}

{{< /tab >}}

{{< tab name="Dockerfile" icon="iconify:simple-icons/docker" >}}

Building from a plain base, create the user yourself. Take the ids as build
arguments so a host with a different uid can pass its own:

```dockerfile {filename=".devcontainer/Dockerfile"}
FROM ubuntu:24.04

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && apt-get install -y --no-install-recommends sudo ca-certificates git \
 && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid $USER_GID $USERNAME \
 && useradd --uid $USER_UID --gid $USER_GID --create-home --shell /bin/bash $USERNAME \
 && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
 && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
```

Everything after `USER` runs unprivileged, so put your `apt-get` layers above
it. Passwordless `sudo` inside a dev container is the normal arrangement: it
keeps the default unprivileged while leaving you able to install a package
without a rebuild.

Pass your real ids in when the host is Linux and you are not uid 1000:

```json {filename=".devcontainer/devcontainer.json"}
  "build": {
    "dockerfile": "Dockerfile",
    "args": { "USER_UID": "1000", "USER_GID": "1000" }
  }
```

{{< callout type="error" >}}
`useradd --uid 1000` fails if the base image already has a user at 1000 —
Ubuntu's own images ship an `ubuntu` user there, and the build stops with
`UID 1000 is not unique`. Either delete that user first
(`userdel -r ubuntu`), or start from
`mcr.microsoft.com/devcontainers/base:ubuntu`, where `vscode` is already sitting
at 1000 and this whole block is unnecessary.
{{< /callout >}}

{{< /tab >}}

{{< /tabs >}}

### Point every home-directory path at that user

Every mount target in this guide is `/home/vscode/...`. If you changed the
user, change them all — a mount into `/home/vscode` on a container whose user
is `node` creates a directory nobody reads, and the symptom is Claude asking
you to log in again with everything apparently configured.

### Keep off the privileged ports

Ports below 1024 need `root`, or a capability you have to grant deliberately.
Choose above it:

```json {filename=".devcontainer/devcontainer.json"}
  "forwardPorts": [8043, 8080]
```

If something genuinely must listen on 443 inside the container, the way to do
it without `root` is a capability on the binary, not a privileged container:

```dockerfile
RUN setcap 'cap_net_bind_service=+ep' /usr/local/bin/your-server
```

### Verify

```shell
id
touch /workspaces/your-project/ownership-check && ls -l /workspaces/your-project/ownership-check
```

`id` should print `uid=1000(vscode)`, not `uid=0(root)`. Then check the same
file **on the host** — it should be yours, with no `sudo` needed to delete it.

{{% /steps %}}

---

## The whole thing

All five, assembled. Same project, same user, same variable names as
everywhere above.

### On the host

One block in your shell profile serves every container on the machine. The
timezone is ungated; the credentials are not.

{{< tabs >}}

{{< tab name="macOS" icon="iconify:bi/apple" selected=true >}}

```zsh {filename="~/.zshrc"}
# Timezone — not a secret, so no guard.
export HOST_TZ="${$(readlink /etc/localtime)##*/zoneinfo/}"

# Everything below exists only while VS Code resolves the environment.
if [[ -n $VSCODE_RESOLVING_ENVIRONMENT ]]; then

  # Load this project's SSH key into the agent, if it is not there already.
  key=~/.ssh/id_ed25519_project
  fp="$(ssh-keygen -lf "$key.pub" 2>/dev/null | awk '{print $2}')"
  if [[ -n $fp ]] && ! ssh-add -l 2>/dev/null | grep -q "$fp"; then
    ssh-add --apple-use-keychain "$key" >/dev/null 2>&1
  fi
  unset key fp

  # Credentials, out of the login keychain.
  export PROJECT_GH_TOKEN="$(security find-generic-password \
    -a project -s gh-token-project -w 2>/dev/null)"
fi
```

{{< /tab >}}

{{< tab name="Ubuntu" icon="iconify:bi/ubuntu" >}}

```zsh {filename="~/.zshrc"}
# Timezone — not a secret, so no guard.
export HOST_TZ="$(timedatectl show -p Timezone --value 2>/dev/null)"

# Everything below exists only while VS Code resolves the environment.
if [[ -n $VSCODE_RESOLVING_ENVIRONMENT ]]; then

  # Load this project's SSH key into the agent, if it is not there already.
  key=~/.ssh/id_ed25519_project
  fp="$(ssh-keygen -lf "$key.pub" 2>/dev/null | awk '{print $2}')"
  if [[ -n $fp ]] && ! ssh-add -l 2>/dev/null | grep -q "$fp"; then
    ssh-add "$key" >/dev/null 2>&1 </dev/null
  fi
  unset key fp

  # Credentials, out of the login keyring.
  export PROJECT_GH_TOKEN="$(secret-tool lookup \
    account project service gh-token-project 2>/dev/null)"
fi
```

{{< /tab >}}

{{< /tabs >}}

Using bash, the same block goes in `~/.bashrc` — VS Code runs the shell as both
interactive and login, so make sure `~/.bash_profile` sources it, as Ubuntu's
default already does. For fish, the guard is
`test -n "$VSCODE_RESOLVING_ENVIRONMENT"` in `~/.config/fish/config.fish`.

### In the repository

{{< tabs >}}

{{< tab name="devcontainer.json" icon="iconify:catppuccin/devcontainer" selected=true >}}

One file, one image.

```json {filename=".devcontainer/devcontainer.json"}
{
  "name": "your-project",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",

  "containerUser": "vscode",
  "remoteUser": "vscode",
  "updateRemoteUserUID": true,

  "containerEnv": {
    "TZ": "${localEnv:HOST_TZ}",
    "CLAUDE_CONFIG_DIR": "/home/vscode/.claude"
  },

  "remoteEnv": {
    "GH_TOKEN": "${localEnv:PROJECT_GH_TOKEN}"
  },

  "mounts": [
    "source=${localEnv:HOME}/.ssh/id_ed25519_project.pub,target=/home/vscode/.ssh/id_container.pub,type=bind,readonly",
    "source=${localEnv:HOME}/.claude,target=/home/vscode/.claude,type=bind"
  ],

  "forwardPorts": [8043],

  "postCreateCommand": "sudo chown \"$(id -u):$(id -g)\" /home/vscode/.ssh && sudo chmod 700 /home/vscode/.ssh && ln -sfn \"${containerWorkspaceFolder}/.devcontainer/ssh-config\" /home/vscode/.ssh/config"
}
```

```sshconfig {filename=".devcontainer/ssh-config"}
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_container.pub
  IdentitiesOnly yes
```

{{< /tab >}}

{{< tab name="docker-compose.yml" icon="iconify:simple-icons/docker" >}}

`devcontainer.json` shrinks to the things compose has no say in — who VS Code
runs as, what it forwards, what it does after creating the container.

```json {filename=".devcontainer/devcontainer.json"}
{
  "name": "your-project",
  "dockerComposeFile": "docker-compose.yml",
  "service": "dev",
  "workspaceFolder": "/workspaces/your-project",

  "remoteUser": "vscode",

  "forwardPorts": [8043],

  "postCreateCommand": "sudo chown \"$(id -u):$(id -g)\" /home/vscode/.ssh && sudo chmod 700 /home/vscode/.ssh && ln -sfn \"${containerWorkspaceFolder}/.devcontainer/ssh-config\" /home/vscode/.ssh/config"
}
```

```yaml {filename=".devcontainer/docker-compose.yml"}
services:
  dev:
    image: mcr.microsoft.com/devcontainers/base:ubuntu
    user: vscode
    command: sleep infinity
    environment:
      - TZ=${HOST_TZ:-Etc/UTC}
      - GH_TOKEN=${PROJECT_GH_TOKEN:-}
      - CLAUDE_CONFIG_DIR=/home/vscode/.claude
    volumes:
      - ..:/workspaces/your-project:cached
      - ssh_home:/home/vscode/.ssh
      - claude_config:/home/vscode/.claude
      - type: bind
        source: ${HOME}/.ssh/id_ed25519_project.pub
        target: /home/vscode/.ssh/id_container.pub
        read_only: true

  db:
    image: postgres:16
    environment:
      - TZ=${HOST_TZ:-Etc/UTC}
      - POSTGRES_PASSWORD=devonly
    volumes:
      - db_data:/var/lib/postgresql/data

volumes:
  ssh_home:
  claude_config:
  db_data:
```

```sshconfig {filename=".devcontainer/ssh-config"}
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_container.pub
  IdentitiesOnly yes
```

This one takes Claude's Option B — a named volume rather than your host's
`~/.claude` — because a compose stack is the shape you reach for when there are
other services in play, and a stranger's `db` container on the same network is
exactly when you want the isolated one. Swap the volume for the bind mount if
the project is yours.

Note `TZ` on the database too. A `postgres` logging in UTC while your
application logs in local time is worse than both being wrong the same way.

{{< /tab >}}

{{< tab name="Dockerfile" icon="iconify:simple-icons/docker" >}}

The image becomes yours, so the timezone and the tooling move into it, and the
credentials stay outside it.

```dockerfile {filename=".devcontainer/Dockerfile"}
FROM mcr.microsoft.com/devcontainers/base:ubuntu

ARG TZ=Etc/UTC
ENV TZ=${TZ}

USER root
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && apt-get install -y --no-install-recommends tzdata gh \
 && rm -rf /var/lib/apt/lists/* \
 && ln -snf "/usr/share/zoneinfo/${TZ}" /etc/localtime \
 && echo "${TZ}" > /etc/timezone

USER vscode
ENV CLAUDE_CONFIG_DIR=/home/vscode/.claude
RUN mkdir -p /home/vscode/.ssh && chmod 700 /home/vscode/.ssh \
 && curl -fsSL https://claude.com/install.sh | bash
```

```json {filename=".devcontainer/devcontainer.json"}
{
  "name": "your-project",
  "build": {
    "dockerfile": "Dockerfile",
    "args": { "TZ": "${localEnv:HOST_TZ}" }
  },

  "containerUser": "vscode",
  "remoteUser": "vscode",
  "updateRemoteUserUID": true,

  "containerEnv": {
    "TZ": "${localEnv:HOST_TZ}"
  },

  "remoteEnv": {
    "GH_TOKEN": "${localEnv:PROJECT_GH_TOKEN}"
  },

  "mounts": [
    "source=${localEnv:HOME}/.ssh/id_ed25519_project.pub,target=/home/vscode/.ssh/id_container.pub,type=bind,readonly",
    "source=${localEnv:HOME}/.claude,target=/home/vscode/.claude,type=bind"
  ],

  "forwardPorts": [8043],

  "postCreateCommand": "sudo chown \"$(id -u):$(id -g)\" /home/vscode/.ssh && sudo chmod 700 /home/vscode/.ssh && ln -sfn \"${containerWorkspaceFolder}/.devcontainer/ssh-config\" /home/vscode/.ssh/config"
}
```

```sshconfig {filename=".devcontainer/ssh-config"}
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_container.pub
  IdentitiesOnly yes
```

Put compose in front of this by replacing `"image:"` in the compose tab with
the `build:` block from the timezone section. Nothing else changes — which is
the point of keeping the three shapes consistent.

{{< /tab >}}

{{< /tabs >}}

### The one command that checks all five

```shell
date && id && ssh-add -l && echo "${GH_TOKEN:+GH_TOKEN set}" && echo "$CLAUDE_CONFIG_DIR"
```

Local time, `uid=1000(vscode)`, a key fingerprint, `GH_TOKEN set`, and a path.
Anything missing points at exactly one of the five sections above.

---

## When something comes back empty

{{< accordion mode="collapse" >}}

{{< accordion-item title="VS Code cached a stale environment" icon="refresh" >}}
The first thing to check, every time, because it explains most of the rest.

The resolved environment is computed **once per application session**. _Reload
Window_ does not redo it. _Rebuild Container_ does not redo it. Quit VS Code
entirely, wait a minute or two, reopen it from Spotlight or the app launcher —
not from `code .` — and only then rebuild.

Launching from a terminal is its own version of the same trap: VS Code inherits
that terminal's environment rather than resolving a fresh one, so a terminal
opened before you edited `~/.zshrc` carries none of your changes.
{{< /accordion-item >}}

{{< accordion-item title="The guard never fired" icon="question-mark-circle" >}}
Prove it rather than guessing. Add a probe to your shell rc:

```zsh
[[ -n $VSCODE_RESOLVING_ENVIRONMENT ]] && date >> /tmp/vscode-env-probe
```

Quit and relaunch VS Code, then look at the file. A new line means the guard
fires and the lookup inside it is at fault. No line means VS Code is not
resolving your shell at all. Remove the probe afterwards.
{{< /accordion-item >}}

{{< accordion-item title="Resolution timed out" icon="clock" >}}
VS Code gives shell resolution ten seconds, then gives up with _"Unable to
resolve your shell environment in a reasonable time"_ — and when it gives up,
**every** variable is absent, not just the slow one.

A `ssh-add` waiting on a passphrase prompt is the usual cause. So is a version
manager doing real work at shell start. Keep everything inside the guard
non-interactive and fast.
{{< /accordion-item >}}

{{< accordion-item title="git works but gh does not, or the reverse" icon="arrows-expand" >}}
Expected, and a useful clue: they share nothing.

git failing is an SSH problem — check `ssh-add -l` inside the container, the
remote URL, and `IdentitiesOnly yes` in the ssh config. `gh` failing is a token
problem — check `echo "${GH_TOKEN:+set}"` and what `gh auth status` names in
parentheses.
{{< /accordion-item >}}

{{< accordion-item title="Claude asks you to log in again" icon="sparkles" >}}
Three causes, in order of likelihood.

`CLAUDE_CONFIG_DIR` is not set, so `~/.claude.json` — which holds the OAuth
account — was written outside the mount and vanished with the container.

The mount target is not the remote user's home. Check `echo $HOME` in the
container against the path in your `mounts`.

The volume is root-owned and Claude Code cannot write to it. `ls -ld
$CLAUDE_CONFIG_DIR`, then `sudo chown -R vscode:vscode` it.
{{< /accordion-item >}}

{{< accordion-item title="The container's clock is still UTC" icon="clock" >}}
`echo $HOST_TZ` on the **host** first. Empty means the export never ran — and
since that one is ungated, it is a shell profile problem, not a VS Code one.

Set on the host but not in the container means the variable is in `remoteEnv`
where it should be in `containerEnv`, or the image has no `/usr/share/zoneinfo`
and cannot resolve the name. Most base images carry it; a `slim` or `alpine`
one may not, and needs `tzdata` installed.
{{< /accordion-item >}}

{{< accordion-item title="Files come back owned by root" icon="user-circle" >}}
`containerUser` is missing. `remoteUser` alone leaves the container's own
processes as `root`, and anything they create is root-owned on the host too.

On a Linux host where your uid is not 1000, also confirm
`updateRemoteUserUID` is on — or, under compose, that the Dockerfile built the
user with your real ids.
{{< /accordion-item >}}

{{< /accordion >}}

## Worth doing once

None of these five is clever. They are each about fifteen minutes, and then
they are permanent: the next project copies a `devcontainer.json` and starts
with the right time, the right key, the right GitHub account, a signed-in
agent, and files that belong to you.

The part worth internalising is not any single setting. It is the shape they
all share — the host keeps the secret and decides the identity, the container
receives a value it never stores, and the repository holds the wiring but never
the credential. Everything above is that sentence, five times.
