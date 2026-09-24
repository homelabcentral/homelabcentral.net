---
title: "yt-dlp"
weight: 9
description: "Command-line audio and video downloader."
---

{{< lead >}}Downloads media from a thousand-plus sites, with fine control over formats and metadata.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/yt-dlp" >}}

## What it does

yt-dlp is the maintained successor to youtube-dl. It resolves a page to its media streams, picks or merges formats, and writes the result with metadata, thumbnails, subtitles and chapters attached.

```shell
# best video+audio up to 1080p, merged to mp4
yt-dlp -f "bv*[height<=1080]+ba/b" --merge-output-format mp4 URL

# audio only
yt-dlp -x --audio-format m4a URL

# a playlist into a tidy tree
yt-dlp -o "%(playlist)s/%(playlist_index)02d - %(title)s.%(ext)s" URL

# subtitles, no video
yt-dlp --skip-download --write-auto-subs --sub-langs en URL
```

## Notes

- Needs `ffmpeg` for merging separate video and audio streams and for any post-processing.
- Site extractors break when sites change; updating (`brew upgrade yt-dlp`) is the fix for most failures.
- Downloading is only lawful for content you have the right to download. Respect terms of service and copyright — this is a tool for archiving your own material, Creative Commons content and things you are licensed to keep.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [youtube-dl](https://github.com/ytdl-org/youtube-dl) | Open source | The original, effectively unmaintained; yt-dlp is the fork that kept going |
| [Downie](https://software.charliemonroe.net/downie/) | Paid | Mac-native, a drag-and-drop GUI over the same job |
| [JDownloader](https://jdownloader.org/) | Open source | Heavier, Java-based, strong at multi-file hosts |
| [gallery-dl](https://github.com/mikf/gallery-dl) | Open source | The equivalent for images and image boards |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install yt-dlp
```

{{< /tab >}}
{{< tab name="pip" >}}

```shell
pipx install yt-dlp
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://github.com/yt-dlp/yt-dlp" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/yt-dlp" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/yt-dlp/yt-dlp" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/yt-dlp/yt-dlp#usage-and-options" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
