---
title: "mas"
weight: 5
description: "Mac App Store from the command line."
---

{{< lead >}}Lists, installs and upgrades App Store apps — the missing half of a scripted machine setup.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/mas" >}}

## What it does

`mas` drives the Mac App Store: list what is installed with version numbers, search the store, install by numeric ID, and upgrade everything outdated.

```shell
mas list                    # installed apps with their IDs
mas outdated
mas upgrade
mas install 497799835       # Xcode, by ID
mas search "color picker"
```

## Why it matters

A setup script can install Homebrew formulae and casks, but App Store apps used to require clicking. `mas` closes that gap, so a Brewfile plus a short `mas install` list reproduces a machine's software completely:

```shell
brew bundle dump --describe    # write a Brewfile from what is installed
mas list | awk '{print $1}'    # the App Store half
```

## Notes

Apps must already be associated with the signed-in Apple Account — `mas` cannot make a first purchase, only install something the account owns. Signing in has to happen in the App Store app itself.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [The App Store app](https://www.apple.com/app-store/) | Built in | The only way to make a first purchase or sign in |
| [Homebrew casks](/software/development/homebrew-app/) | Open source | For anything that also ships outside the App Store; `mas` is the fallback, not the default |
| MDM (Jamf, Kandji, Mosyle) | Paid | How this is actually solved for fleets |
{{< /borderless-table >}}

## Install

```shell
brew install mas
```

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/mas-cli/mas" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/mas" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/mas-cli/mas" title="Repository" icon="github" subtitle="Source code" >}}
{{< /cards >}}
