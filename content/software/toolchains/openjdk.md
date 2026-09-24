---
title: "OpenJDK"
weight: 3
description: "Java development kit and runtime."
---

{{< lead >}}The reference Java implementation — compiler, runtime and tooling.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/openjdk" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://jdk.java.net/" >}}

## What it does

OpenJDK provides `javac`, `java`, `jshell`, `jar`, and the diagnostic tools (`jcmd`, `jstack`, `jmap`) used to inspect a running JVM. It is the upstream all commercial JDK builds derive from.

## Where it fits

Mostly as a dependency: Maven needs a JDK, and several self-hosted homelab services — anything Kafka, Elasticsearch, Minecraft or Jenkins-adjacent — ship as JVM applications.

## Notes

Homebrew installs OpenJDK keg-only, so it is not linked into `PATH` automatically. To let macOS's `/usr/libexec/java_home` find it:

```shell
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk \
  /Library/Java/JavaVirtualMachines/openjdk.jdk
```

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Eclipse Temurin](https://adoptium.net/) | Open source | The most widely used prebuilt OpenJDK, from Adoptium |
| [Amazon Corretto](https://aws.amazon.com/corretto/) and [Azul Zulu](https://www.azul.com/downloads/) | Free | Long-term-supported builds with vendor backing |
| [GraalVM](https://www.graalvm.org/) | Open source | Adds native-image ahead-of-time compilation |
| [Oracle JDK](https://www.oracle.com/java/technologies/downloads/) | Free | The same code, different licence terms |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install openjdk
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Builds from jdk.java.net](https://jdk.java.net/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://openjdk.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/openjdk" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://docs.oracle.com/en/java/javase/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
