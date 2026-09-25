---
title: "yt-dlp"
weight: 14
description: "Command-line audio and video downloader."
---

{{< lead >}}Downloads media from a thousand-plus sites, with fine control over formats and metadata.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/yt-dlp" >}}

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

## Aliases

The flags above are long and never change, which makes yt-dlp a good candidate for a block of shell aliases. Drop this in `~/.zshrc` — or in a file it sources — and the common cases become one word.

```shell
# Defined only when yt-dlp is on PATH, so shells without it start clean.
if (( $+commands[yt-dlp] )); then
  # Flags shared by every download alias below. Referenced at call time, so
  # editing this array changes all of them at once.
  _yt_common=(
    --embed-metadata
    --embed-chapters
    --embed-thumbnail
    --sponsorblock-mark all
    --concurrent-fragments 4
    -o '%(title)s [%(id)s].%(ext)s'
  )

  # Cookie source for private, age-gated or members-only videos. Empty by
  # default: an empty zsh array expands to zero words, so the aliases below
  # run cookie-free until you opt in. Set it for the session with
  # `ytcookies brave`, or persist it by exporting YTDL_COOKIES (a browser
  # name, "browser:Profile Name", or a cookies.txt path).
  _yt_cookies=()
  if [[ -n $YTDL_COOKIES ]]; then
    if [[ -f $YTDL_COOKIES ]]; then
      _yt_cookies=(--cookies "$YTDL_COOKIES")
    else
      _yt_cookies=(--cookies-from-browser "$YTDL_COOKIES")
    fi
  fi

  ytcookies() {
    case "$1" in
      '')
        if (( $#_yt_cookies )); then
          print "yt cookies: ${_yt_cookies[2]} (${_yt_cookies[1]})"
        else
          print 'yt cookies: off'
        fi
        ;;
      off|none|clear)
        _yt_cookies=()
        print 'yt cookies: off'
        ;;
      *)
        if [[ -f $1 ]]; then
          _yt_cookies=(--cookies "${1:A}")
        else
          _yt_cookies=(--cookies-from-browser "$1")
        fi
        print "yt cookies: ${_yt_cookies[2]} (${_yt_cookies[1]})"
        ;;
    esac
  }

  # Video. --no-playlist so a playlist URL grabs only the video you pasted.
  alias ytv='yt-dlp "${_yt_common[@]}" "${_yt_cookies[@]}" --no-playlist --embed-subs --sub-langs "en.*" -f "bv*[height<=1080][vcodec^=avc1]+ba[acodec^=mp4a]/b[height<=1080]" --merge-output-format mp4'
  alias ytmax='yt-dlp "${_yt_common[@]}" "${_yt_cookies[@]}" --no-playlist -f "bv*+ba/b" -S "res,fps,hdr:12,vcodec:av01,br" --merge-output-format mkv'
  alias yt4k='yt-dlp "${_yt_common[@]}" "${_yt_cookies[@]}" --no-playlist -f "bv*+ba/b" -S "res:2160,fps,hdr:12,br" --merge-output-format mkv'
  alias yt1080='yt-dlp "${_yt_common[@]}" "${_yt_cookies[@]}" --no-playlist -f "bv*+ba/b" -S "res:1080,fps,br" --merge-output-format mkv'

  # Audio. ytm4a/ytopus keep the source stream (no lossy re-encode); ytmp3
  # re-encodes, for players that only speak mp3.
  alias ytmp3='yt-dlp "${_yt_common[@]}" "${_yt_cookies[@]}" --no-playlist -x --audio-format mp3 --audio-quality 0'
  alias ytm4a='yt-dlp "${_yt_common[@]}" "${_yt_cookies[@]}" --no-playlist -f "ba[ext=m4a]/ba" -x --audio-format m4a --audio-quality 0'
  alias ytopus='yt-dlp "${_yt_common[@]}" "${_yt_cookies[@]}" --no-playlist -f "ba[ext=webm]/ba" -x --audio-format opus --audio-quality 0'

  # Whole playlist into its own folder, zero-padded track numbers.
  alias ytlist='yt-dlp "${_yt_cookies[@]}" --embed-metadata --embed-chapters --embed-thumbnail --sponsorblock-mark all --concurrent-fragments 4 --yes-playlist -f "bv*+ba/b" -S "res:1080,fps,br" --merge-output-format mkv -o "%(playlist)s/%(playlist_index)03d - %(title)s.%(ext)s"'

  # Sidecars, no media.
  alias ytsub='yt-dlp "${_yt_cookies[@]}" --skip-download --write-subs --write-auto-subs --sub-langs "en.*" --convert-subs srt -o "%(title)s [%(id)s].%(ext)s"'
  alias ytthumb='yt-dlp "${_yt_cookies[@]}" --skip-download --write-thumbnail --convert-thumbnails jpg -o "%(title)s [%(id)s].%(ext)s"'
  alias ytfmt='yt-dlp "${_yt_cookies[@]}" -F'

  alias ytup='brew upgrade yt-dlp'

  # ytclip URL START END   e.g. ytclip https://youtu.be/xyz 1:20 2:45
  ytclip() {
    if (( $# < 3 )); then
      print -u2 'usage: ytclip URL START END   (e.g. ytclip URL 1:20 2:45)'
      return 2
    fi
    yt-dlp "${_yt_common[@]}" "${_yt_cookies[@]}" --no-playlist \
      --download-sections "*$2-$3" --force-keyframes-at-cuts \
      -f "bv*+ba/b" -S "res,fps,br" --merge-output-format mkv \
      -o '%(title)s [%(id)s] '"$2-$3"'.%(ext)s' \
      "$1"
  }
fi
```

What each one is for:

{{< borderless-table >}}
| Alias | Does |
| --- | --- |
| `ytv URL` | 1080p H.264 + AAC in an mp4 — the format everything plays |
| `ytmax URL` | Best available, AV1 and HDR preferred, in mkv |
| `yt4k URL` / `yt1080 URL` | Capped at that resolution rather than best-effort |
| `ytmp3` / `ytm4a` / `ytopus` | Audio only; `m4a` and `opus` keep the source stream, `mp3` re-encodes |
| `ytlist URL` | The whole playlist into its own folder, tracks numbered `001 -` |
| `ytsub` / `ytthumb` | Subtitles or thumbnail, no media |
| `ytfmt URL` | List the formats the site offers, so `-f` can be chosen by hand |
| `ytclip URL 1:20 2:45` | Only that section, cut at keyframes |
| `ytcookies brave` | Read cookies live from a browser for the rest of the session |
| `ytup` | Update yt-dlp, which fixes most extractor failures |
{{< /borderless-table >}}

The syntax is zsh. In bash, replace `(( $+commands[yt-dlp] ))` with `command -v yt-dlp >/dev/null` and `${1:A}` with `$(cd "$(dirname "$1")" && printf '%s/%s' "$PWD" "$(basename "$1")")`.

{{< callout type="warning" >}}
`--cookies-from-browser` hands yt-dlp your live session cookies for that site. It is the only way to reach anything behind a login, and it is also a credential — do not pair it with a URL you do not trust, and prefer an exported `cookies.txt` scoped to one site when you can.
{{< /callout >}}

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
