---
title: "LineSmith for Xcode"
weight: 8
description: "Xcode source editor extension for line editing."
---

{{< lead >}}Adds 31 line-editing and Swift-generation commands to Xcode's editor.{{< /lead >}}

{{< badge content="Mac App Store" color="purple" icon="shopping-bag" link="https://apps.apple.com/us/app/id1234445803" >}}

## What it does

LineSmith is a source editor extension: it appears under **Editor → LineSmith** in Xcode and adds the line operations Xcode never shipped — move, duplicate, delete, join and sort lines — plus Swift code generation helpers.

Assign keyboard shortcuts in **Xcode → Settings → Key Bindings** or the commands are a menu trip each time.

## Notes

The app on disk may still be named **TextPlus**; that was its earlier name before it was rebranded to LineSmith. Source editor extensions must be enabled once in **System Settings → Login Items & Extensions → Xcode Source Editor**.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| Xcode's own commands | Built in | ⌘D duplicates a line and ⌥⌘[ / ⌥⌘] move one; check before installing anything |
| [VS Code](/software/development/visual-studio-code/) or [Cursor](https://cursor.com/) with sourcekit-lsp | Free / Freemium | Richer line editing, at the cost of leaving Xcode |
| [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) | Open source | For the formatting half, applied consistently on save or in CI |
{{< /borderless-table >}}

## Install

[LineSmith for Xcode on the Mac App Store](https://apps.apple.com/us/app/id1234445803)

Or with `mas`:

```shell
mas install 1234445803
```

## Links

{{< cards cols="2" >}}
{{< card link="https://apps.apple.com/us/app/id1234445803" title="Mac App Store" icon="shopping-bag" subtitle="Free on the Mac App Store" >}}
{{< /cards >}}
