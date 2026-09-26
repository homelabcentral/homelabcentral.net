---
title: "Adobe Acrobat Reader"
weight: 1
description: "Read, annotate and fill PDFs."
---

{{< lead >}}The reference PDF reader, for forms and documents Preview mishandles.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/adobe-acrobat-reader" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://get.adobe.com/reader/" >}}

## What it does

Acrobat Reader displays PDFs, fills and saves AcroForms and XFA forms, applies signatures, and handles annotation and commenting. Its advantage over Preview is fidelity on documents that use features Preview implements partially — complex forms, embedded JavaScript, digital signature validation, and some government and banking documents that outright require it.

## Notes

- Free; the paid Acrobat Pro adds editing, OCR and conversion.
- It installs background updater and integration components. If that is unwelcome, [Stirling-PDF](/software/productivity/stirling-pdf/) covers manipulation locally and Preview covers reading.
- The installed folder is named **Adobe Acrobat DC**, which is the older product naming.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Preview](https://support.apple.com/guide/preview/welcome/mac) | Built in | Built into macOS, and enough for reading, annotating and simple forms |
| [PDF Expert](https://pdfexpert.com/) | Paid | Mac-native, far lighter than Acrobat |
| [Skim](https://skim-app.sourceforge.io/) | Open source | Built for annotating academic papers |
| [PDFgear](https://www.pdfgear.com/) | Freemium | Editing and conversion |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask adobe-acrobat-reader
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://get.adobe.com/reader/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.adobe.com/acrobat/pdf-reader.html" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/adobe-acrobat-reader" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
