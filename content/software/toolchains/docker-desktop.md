---
title: "Docker Desktop"
weight: 6
description: "Container runtime, CLI and dev container host."
---

{{< lead >}}Linux containers on macOS, plus the CLI that dev containers and CI images are built with.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/docker-desktop" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://www.docker.com/products/docker-desktop/" >}}

## What it does

Docker Desktop runs a lightweight Linux VM and exposes the Docker Engine, `docker` CLI, Compose and a Kubernetes cluster on top of it. On Apple Silicon it uses Apple's Virtualization framework, with Rosetta available for `linux/amd64` images.

## Why it matters beyond containers

Docker is also what makes **dev containers** work: a `.devcontainer/` directory describes a full toolchain, and the editor builds and attaches to it. That gives a project a reproducible environment, keeps its dependencies off the host, and lets a contributor match what CI runs instead of approximating it.

## Notes

- Disk usage grows quietly. `docker system prune -a` and the **Resources → Advanced** disk slider are the two levers worth knowing.
- The cask token is `docker-desktop`; the older `docker` token now refers to the CLI-only formula.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [OrbStack](https://orbstack.dev/) | Freemium | Dramatically faster and lighter on macOS, drop-in compatible; the usual reason people switch |
| [Colima](https://github.com/abiosoft/colima) | Open source | CLI-only, Lima-based, no licence question |
| [Podman Desktop](https://podman-desktop.io/) | Open source | Daemonless and rootless, with a Docker-compatible CLI |
| [Rancher Desktop](https://rancherdesktop.io/) | Open source | Kubernetes-first, open source |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask docker-desktop
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.docker.com/products/docker-desktop/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.docker.com/products/docker-desktop/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/docker-desktop" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://docs.docker.com/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
