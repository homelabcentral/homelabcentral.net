---
title: "Xcode"
weight: 2
description: "Apple's IDE, SDKs, simulators and command-line tools."
---

{{< lead >}}Apple's toolchain: without it nothing Swift, iOS or macOS builds at all.{{< /lead >}}

{{< badge content="Mac App Store" color="purple" icon="shopping-bag" size="lg" link="https://apps.apple.com/us/app/id497799835" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://developer.apple.com/download/all/" >}}

## What it does

Xcode bundles the Swift and Clang compilers, the iOS/macOS/watchOS/tvOS/visionOS SDKs, Interface Builder, the simulator runtimes, Instruments for profiling, and the signing and archiving machinery that produces an App Store build.

Much of it is usable without ever opening the app. `xcodebuild`, `xcrun`, `simctl` and `swift` come from the same install and are what CI and most automation actually call.

## Notes

- A full install is tens of gigabytes; the simulator runtimes are the bulk of it and can be pruned from **Settings → Components**.
- `sudo xcode-select --switch /Applications/Xcode.app` points the command-line tools at a specific install when more than one is present.
- The standalone **Command Line Tools** package is enough for Homebrew and `git`, but not for building apps.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| Nothing | — | For building and signing Apple platform apps. The SDKs, simulators, signing tools and Interface Builder ship only here. |
| [VS Code](/software/development/visual-studio-code/) or [Cursor](https://cursor.com/) with sourcekit-lsp | Free / Freemium | A pleasant editor for Swift, still calling `xcodebuild` underneath |
| [Xcodes.app](https://github.com/XcodesOrg/XcodesApp) | Open source | Manages multiple Xcode versions side by side rather than replacing it |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Mac App Store" selected=true >}}

[Xcode on the Mac App Store](https://apps.apple.com/us/app/id497799835)

Or with `mas`:

```shell
mas install 497799835
```

{{< /tab >}}
{{< tab name="Apple Developer" >}}

Older and beta releases: [developer.apple.com/download](https://developer.apple.com/download/all/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://developer.apple.com/xcode/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://apps.apple.com/us/app/id497799835" title="Mac App Store" icon="shopping-bag" subtitle="Free on the Mac App Store" >}}
{{< card link="https://developer.apple.com/documentation/xcode" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< card link="https://developer.apple.com/documentation/xcode-release-notes" title="Release notes" icon="newspaper" subtitle="What changed per version" >}}
{{< /cards >}}
