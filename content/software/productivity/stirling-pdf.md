---
title: "Stirling-PDF"
weight: 2
description: "Local PDF toolkit — merge, split, convert, OCR, redact."
---

{{< lead >}}Everything the online PDF converters do, without uploading the document to anyone.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/stirling-pdf" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://stirling.com/download" >}}

## What it does

Stirling-PDF is a large collection of PDF operations behind one interface: merge, split, rotate, reorder and delete pages; convert to and from images, Office formats and HTML; compress; OCR with Tesseract; add or remove passwords and permissions; redact; sign; repair damaged files; compare two documents.

Its reason to exist is the alternative. "Free online PDF merge" means uploading the document to a stranger's server, which is unacceptable for anything with an address, a signature or a bank detail on it. This runs locally.

## Three ways to run it

The project started as a container and grew a desktop app, so there are now three deployments of the same tool. They differ in where the work happens, not in what it can do.

{{< borderless-table >}}
| Route | What it is | When |
| --- | --- | --- |
| **Desktop app** | A signed universal macOS `.dmg` that bundles the server and runs it locally | One Mac, nothing to maintain |
| **Container** | `stirlingtools/s-pdf`, reachable from every device on the network | A homelab, or a family that keeps asking you to merge PDFs |
| **Hosted** | Stirling's own instance | Never, for anything you would not email to a stranger |
{{< /borderless-table >}}

The standalone download is the newer of the two local options and needs no Docker, no Java and no configuration — install it and it is an ordinary Mac application, with the same operation set as the container.

## Notes

- OCR language packs are downloaded separately and are worth adding for any non-English documents.
- The container is the better choice the moment more than one device needs it: put it behind [Tailscale](/software/networking/tailscale/) rather than on the open internet.

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

A universal macOS `.dmg` — the standalone desktop build, no Docker required:

[Download from the developer](https://stirling.com/download) · [releases on GitHub](https://github.com/Stirling-Tools/Stirling-PDF/releases/latest)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://stirling.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://stirling.com/download" title="Downloads" icon="download" subtitle="Standalone desktop builds" >}}
{{< card link="https://formulae.brew.sh/cask/stirling-pdf" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/Stirling-Tools/Stirling-PDF" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://docs.stirling.com/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
