---
title: "FileFillet"
weight: 12
description: "Copy or move files to a favourite folder without a second window."
---

{{< lead >}}A panel of favourite folders that appears where the cursor is, so a file goes where it belongs without opening Finder twice.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/filefillet" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.filefillet.com/" >}}

## What it does

FileFillet keeps a list of destination folders and puts it in front of you at the moment you need it. Hold **⌃** while dragging and the panel opens at the cursor; push the pointer into a screen edge and it slides in. Drop onto a folder to copy or move, and subfolders are reachable from their parent, so the favourites list stays short instead of growing a tile per destination.

The job it removes is the second Finder window — the one opened to drag a download into, then closed again. For files arriving in a predictable shape, rules do this unattended; [Forel](/software/files/forel/) is that. FileFillet is for the decisions that need a person, made in one gesture rather than four.

Layout is yours: window size and tile placement are both configurable, and transfers run concurrently so the interface does not freeze on a large copy.

## Notes

- €8.99 once, plus VAT where applicable, with a 7-day trial and up to two Macs per licence. Free updates within the 2.x line. Sold through LemonSqueezy rather than the App Store.
- macOS 14.6 or later, Apple Silicon and Intel.
- Closed source; the public repository is for issues and feature requests.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| Finder's ⌘C then ⌥⌘V | Built in | Free, and both windows have to be open |
| [Dropover](https://dropoverapp.com/) | Freemium | A shelf to collect files on, with no destination list |
| [Yoink](https://eternalstorms.at/yoink/) | Paid | The same shelf idea, with more places to park things |
| [Default Folder X](https://www.stclairsoft.com/DefaultFolderX/) | Paid | Favourites inside save and open dialogs, not the Desktop |
| [Forel](/software/files/forel/) | Open source | Rules doing it unattended, with nothing to choose |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask filefillet
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download the .dmg or .zip from the project site](https://www.filefillet.com/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.filefillet.com/" title="filefillet.com" icon="globe-alt" subtitle="Official site, pricing and changelog" >}}
{{< card link="https://formulae.brew.sh/cask/filefillet" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/brainchest/FileFillet-Feedback" title="Feedback tracker" icon="github" subtitle="Issues and feature requests" >}}
{{< /cards >}}
