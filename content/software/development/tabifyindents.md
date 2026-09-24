---
title: "TabifyIndents for Xcode"
weight: 9
description: "Convert leading spaces to tabs and back, inside Xcode."
---

{{< lead >}}Two Xcode editor commands: turn leading spaces into tabs, or tabs into spaces.{{< /lead >}}

{{< badge content="Mac App Store" color="purple" icon="shopping-bag" size="lg" link="https://apps.apple.com/us/app/id1179234554" >}}

## What it does

TabifyIndents adds **Tabify** and **Untabify** to Xcode's editor menu. Tabify replaces leading space runs with the right number of tabs; Untabify does the reverse. Both respect the indentation width configured for the file.

That is the whole app. It exists because Xcode has no built-in command for it, and a project that mandates tabs will otherwise reject a file a contributor wrote with spaces.

## Notes

Like any source editor extension, it must be enabled in **System Settings → Login Items & Extensions → Xcode Source Editor** before the menu items appear.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [EditorConfig](https://editorconfig.org/) | Open source | Sets indentation per project so files never arrive wrong |
| `expand` and `unexpand` | Built in | Built into macOS, scriptable over a whole tree |
| [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) or [swift-format](https://github.com/swiftlang/swift-format) | Open source | Normalises indentation as part of formatting |
{{< /borderless-table >}}

## Install

[TabifyIndents for Xcode on the Mac App Store](https://apps.apple.com/us/app/id1179234554)

Or with `mas`:

```shell
mas install 1179234554
```

## Links

{{< cards cols="2" >}}
{{< card link="https://apps.apple.com/us/app/id1179234554" title="Mac App Store" icon="shopping-bag" subtitle="Free on the Mac App Store" >}}
{{< /cards >}}
