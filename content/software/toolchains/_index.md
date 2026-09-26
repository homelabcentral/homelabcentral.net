---
title: "Languages, Runtimes & Build Tools"
weight: 10
description: "Language toolchains, package managers, containers and the tools that build and check a project."
---

{{< lead >}}What compiles, runs, packages and checks the code — installed once, then mostly forgotten about. Add the other language toolchains as something needs them.{{< /lead >}}

Half of this is installed because something else needs it: Maven wants a JDK, Hugo Modules resolve through the Go tool, a dev container needs Docker.

{{< cards cols="3" >}}
{{< card link="go" title="Go" icon="code" subtitle="Go compiler and module toolchain." >}}
{{< card link="bun" title="Bun" icon="lightning-bolt" subtitle="JavaScript runtime, bundler, transpiler and package manager." >}}
{{< card link="openjdk" title="OpenJDK" icon="beaker" subtitle="Java development kit and runtime." >}}
{{< card link="maven" title="Apache Maven" icon="archive" subtitle="Java build and dependency management." >}}
{{< card link="miniforge" title="Miniforge" icon="beaker" subtitle="Minimal conda installer defaulting to conda-forge." >}}
{{< card link="docker-desktop" title="Docker Desktop" icon="cube" subtitle="Container runtime, CLI and dev container host." >}}
{{< card link="hugo" title="Hugo" icon="iconify:devicon-plain/hugo" subtitle="Fast static site generator, shipped as a single binary." >}}
{{< card link="xcodegen" title="XcodeGen" icon="template" subtitle="Generate .xcodeproj from a YAML spec." >}}
{{< card link="idb-companion" title="idb-companion" icon="device-mobile" subtitle="Companion server for automating iOS simulators." >}}
{{< card link="act" title="act" icon="play" subtitle="Run GitHub Actions workflows locally." >}}
{{< card link="actionlint" title="actionlint" icon="check-circle" subtitle="Static checker for GitHub Actions workflow files." >}}
{{< /cards >}}
