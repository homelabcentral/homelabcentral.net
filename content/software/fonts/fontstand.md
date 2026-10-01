---
title: "Fontstand"
weight: 15
description: "Try fonts for an hour, rent them by the month."
---

{{< lead >}}A catalogue of independent foundries that installs a typeface for an hour free, or by the month until it is paid off.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/fontstand" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://fontstand.com/" >}}

## What it does

Fontstand is a font shop that lends before it sells. Any family in the catalogue installs for one hour at no cost, system-wide and in every application, which is long enough to set real copy in the actual layout rather than judging a specimen image. After that an individual style rents by the month for a fraction of its licence price, and twelve rented months — consecutive or not — convert into a permanent desktop licence.

What it is not is a subscription library: nothing is bundled, each family is rented or bought on its own, and a rental that lapses simply deactivates. Once a trial or rental is active the files are on disk and work offline with the app closed.

The catalogue is the point. It is independent foundries rather than the Adobe or Monotype back catalogue, which is where it earns a place next to the free monospaced families above — and a cheaper way to live with a paid face for a week than [MonoLisa](/software/fonts/font-monolisa/)'s outright licence.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Adobe Fonts](https://fonts.adobe.com/) | Subscription | Bundled with Creative Cloud, and gone when it lapses |
| [Google Fonts](https://fonts.google.com/) | Open source | Free and permanent, a narrower catalogue |
| [MyFonts](https://www.myfonts.com/) | Paid | The licence up front, with no hour to test it in |
| [Monotype Fonts](https://www.monotype.com/fonts) | Subscription | Library licensing aimed at teams |
| Buying direct from the foundry | — | Everything the foundry sells, and the full price |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask fontstand
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://fontstand.com/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://fontstand.com/" title="Homepage" icon="globe-alt" subtitle="Official site and catalogue" >}}
{{< card link="https://formulae.brew.sh/cask/fontstand" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
