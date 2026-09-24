---
title: "XcodeGen"
weight: 8
description: "Generate .xcodeproj from a YAML spec."
---

{{< lead >}}Generates the Xcode project from a spec file so the `.xcodeproj` never has to be committed.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/xcodegen" >}}

## What it does

XcodeGen reads a `project.yml` describing targets, schemes, build settings and dependencies, plus your folder structure, and writes the `.xcodeproj` from scratch. The generated project is then gitignored.

## Why that matters

`project.pbxproj` is a machine-written file with unstable ordering — it is the single worst merge conflict in iOS development. Generating it means the reviewable artefact is a 40-line YAML file, and two branches that both added files merge cleanly.

## Notes

Run `xcodegen generate` after any file add or rename, and add it to a bootstrap script so contributors do not open a stale project.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Tuist](https://tuist.dev/) | Freemium | The same idea with a larger feature set: caching, module graphs, generated tests |
| [Swift Package Manager](https://www.swift.org/documentation/package-manager/) | Built in | No `.xcodeproj` to generate when the target can be a package |
| [Bazel with rules_apple](https://github.com/bazelbuild/rules_apple) | Open source | For large repositories that need hermetic, cached builds |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install xcodegen
```

{{< /tab >}}
{{< tab name="Mint" >}}

```shell
mint install yonaskolb/xcodegen
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/yonaskolb/XcodeGen" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/xcodegen" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/yonaskolb/XcodeGen" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/yonaskolb/XcodeGen/blob/master/Docs/ProjectSpec.md" title="Documentation" icon="book-open" subtitle="Project spec reference" >}}
{{< /cards >}}
