---
title: "Stirling-PDF"
weight: 2
description: "Local PDF toolkit — merge, split, convert, OCR, redact."
---

{{< lead >}}Everything the online PDF converters do, without uploading the document to anyone.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/stirling-pdf" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://stirling.com/" >}}

## What it does

Stirling-PDF is a large collection of PDF operations behind one interface: merge, split, rotate, reorder and delete pages; convert to and from images, Office formats and HTML; compress; OCR with Tesseract; add or remove passwords and permissions; redact; sign; repair damaged files; compare two documents.

Its reason to exist is the alternative. "Free online PDF merge" means uploading the document to a stranger's server, which is unacceptable for anything with an address, a signature or a bank detail on it. This runs locally.

## Notes

- The desktop app is one way to run it; the project is best known as a **self-hosted container**, which is the natural fit for a homelab:

```shell
docker run -d -p 8080:8080 --name stirling-pdf stirlingtools/s-pdf:latest
```

- OCR language packs are downloaded separately and are worth adding for any non-English documents.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Adobe Acrobat Pro](https://www.adobe.com/acrobat/acrobat-pro.html) | Subscription | The commercial standard, subscription |
| [PDF Expert](https://pdfexpert.com/) | Paid | Native, covers editing and OCR |
| [Preview](https://support.apple.com/guide/preview/welcome/mac) | Built in | Handles merging and page reordering |
| [qpdf](https://qpdf.sourceforge.io/), [Ghostscript](https://www.ghostscript.com/) and [OCRmyPDF](https://ocrmypdf.readthedocs.io/) | Open source | The same operations as composable CLI tools |
| [Smallpdf](https://smallpdf.com/) or [Sejda](https://www.sejda.com/) | Freemium | The web services this exists to avoid uploading to |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask stirling-pdf
```

{{< /tab >}}
{{< tab name="Docker" >}}

```shell
docker run -d -p 8080:8080 \
  -v ./trainingData:/usr/share/tessdata \
  --name stirling-pdf stirlingtools/s-pdf:latest
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://stirling.com/)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://stirling.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/stirling-pdf" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/Stirling-Tools/Stirling-PDF" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://docs.stirling.com/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
