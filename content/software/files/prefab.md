---
title: "Prefab"
weight: 11
description: "Record a project's folder structure once and deploy it again."
---

{{< lead >}}Lays out folders and starter files on a canvas, then recreates that structure on demand with the names filled in.{{< /lead >}}

{{< badge content="App Store" color="blue" icon="iconify:charm/download" size="lg" link="https://apps.apple.com/us/app/id6758208322" >}}

## What it does

Prefab is a template editor for folder structures. A template is drawn as a tree — folders with Finder tags and icons, files with their starter contents — and deploying it writes that tree to disk. Placeholders like `{{client_name}}` are filled in at deploy time, so one template covers every client and every job rather than one per project.

An existing project folder can be handed to it and read back as a template, structure only or contents included, which is usually faster than drawing the thing from scratch. Templates nest, and watched folders deploy a template automatically when something appears.

It is sandboxed with no network access, so templates stay local; sharing one means sending the file.

Where this sorts nothing and creates everything, [Forel](/software/files/forel/) is the reverse.

## Notes

The macOS build is App Store only — there is no cask and no direct download. A Windows build exists, distributed from the site and not yet signed.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| Duplicating a folder you keep around | — | Nothing to install, and every name edited by hand |
| `mkdir -p` in a shell script | — | Free and precise, and nobody else on the team will run it |
| [cookiecutter](https://cookiecutter.readthedocs.io/) | Open source | Built for code projects, driven from the terminal |
| [Hazel](https://www.noodlesoft.com/) | Paid | Acts on files that arrive rather than creating any |
| [Forel](/software/files/forel/) | Open source | Sorts an existing mess instead of preventing it |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="App Store" selected=true >}}

[Prefab on the Mac App Store](https://apps.apple.com/us/app/id6758208322)

Or, with [mas](/software/productivity/mas/):

```shell
mas install 6758208322
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.prefabapp.io/" title="prefabapp.io" icon="globe-alt" subtitle="Official site and documentation" >}}
{{< card link="https://apps.apple.com/us/app/id6758208322" title="Mac App Store" icon="shopping-bag" subtitle="Where the macOS build comes from" >}}
{{< /cards >}}
