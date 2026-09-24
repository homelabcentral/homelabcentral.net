---
title: "Apache Maven"
weight: 4
description: "Java build and dependency management."
---

{{< lead >}}Declarative builds for JVM projects, driven by a `pom.xml`.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/maven" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://maven.apache.org/download.cgi" >}}

## What it does

Maven builds Java projects from a declarative POM: dependencies are coordinates resolved from Maven Central into `~/.m2/repository`, and the build itself is a fixed lifecycle (`validate`, `compile`, `test`, `package`, `install`, `deploy`) that plugins bind into.

Its value is conventions over configuration — any Maven project builds with `mvn package` regardless of who wrote it.

## Notes

Requires a JDK, so it pulls in `openjdk`. The local repository under `~/.m2` grows without bound and is safe to delete when disk gets tight.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Gradle](https://gradle.org/) | Open source | Faster incremental builds, Kotlin or Groovy build scripts instead of XML |
| [Bazel](https://bazel.build/) | Open source | For very large, multi-language repositories |
| [sbt](https://www.scala-sbt.org/) | Open source | The Scala world's default |
| [Ant](https://ant.apache.org/) | Open source | The predecessor; you will meet it in old projects |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install maven
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://maven.apache.org/download.cgi)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://maven.apache.org/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/maven" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://maven.apache.org/guides/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
