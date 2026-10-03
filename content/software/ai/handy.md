---
title: "Handy"
weight: 4
description: "Offline push-to-talk dictation, free and open source."
---

{{< lead >}}Hold a shortcut, speak, release — Whisper runs on your own machine and the text lands in the focused field.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/handy" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://handy.computer/" >}}

## What it does

Handy is dictation with nothing around it. A configurable shortcut records — held, or tapped to toggle — silence is trimmed with Silero voice activity detection, and the audio is transcribed locally before being pasted wherever the cursor is. No account, no cloud leg, no subscription.

Models are a choice rather than a fixed cost: Whisper Small through Large, GPU-accelerated when the hardware allows, or Parakeet V3, which is CPU-friendly and detects the language itself. The larger Whisper builds are better on technical vocabulary; the smaller ones are faster to load and quicker to return.

It is the open-source answer to Wispr Flow, and the comparison next door is [FluidVoice](/software/ai/fluidvoice/), which adds a local language model to clean up filler words, and [VoiceBox](/software/ai/voicebox/). All three transcribe on device; Handy is the one with no paid tier at all, and the one that also runs on Windows and Linux.

## Notes

- Needs **Microphone** and **Accessibility** permissions — the second is what allows inserting text into another application.
- The Homebrew cask is not maintained by the project. It installs the same release as the site.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Wispr Flow](https://wisprflow.ai/) | Freemium | The best-known commercial dictation app; cloud transcription |
| [Superwhisper](https://superwhisper.com/) | Freemium | Whisper-based, with local and cloud modes |
| [VoiceInk](https://tryvoiceink.com/) | Open source | Local |
| [MacWhisper](https://goodsnooze.gumroad.com/l/macwhisper) | Freemium | Strong on transcribing files, less on live dictation |
| macOS Dictation | Built in | Weaker on technical vocabulary and punctuation |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask handy
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the project site](https://handy.computer/) or the [GitHub releases page](https://github.com/cjpais/Handy/releases).

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://handy.computer/" title="handy.computer" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/handy" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://github.com/cjpais/Handy" title="cjpais/Handy" icon="github" subtitle="Source and releases, MIT licensed" >}}
{{< /cards >}}
