---
title: "VLC"
weight: 12
description: "Plays nearly anything, from nearly anywhere."
---

{{< lead >}}The universal fallback player, and a surprisingly capable streaming and conversion tool.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/vlc" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://www.videolan.org/vlc/download-macosx.html" >}}

## What it does

VLC plays local files, optical media, network streams, DVB and RTSP cameras, with codecs bundled rather than relying on the system. Beyond playback it can transcode, stream over HTTP or RTP, and act as a quick IP camera viewer — all from the same binary.

```shell
# play an RTSP camera stream
vlc rtsp://192.168.1.50:554/stream1

# headless transcode
cvlc in.avi --sout '#transcode{vcodec=h264,acodec=mp4a}:std{dst=out.mp4}' vlc://quit
```

## Notes

Worth having alongside IINA for exactly two reasons: files IINA refuses, and network protocols IINA does not implement. For normal local playback IINA is the nicer app.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [IINA](/software/media/iina/) | Open source | Better-looking and better-behaved for local playback on a Mac |
| [mpv](https://mpv.io/) | Open source | The same engine family, scriptable, no interface to speak of |
| [Infuse](https://firecore.com/infuse) | Freemium | The nicest client for a home media library |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask vlc
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://www.videolan.org/vlc/download-macosx.html)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://www.videolan.org/vlc/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/vlc" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://code.videolan.org/videolan/vlc" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://wiki.videolan.org/Documentation:User_Guide/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
