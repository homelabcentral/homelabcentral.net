---
title: "FluidVoice"
weight: 2
description: "Offline voice-to-text dictation with AI cleanup."
---

{{< lead >}}Hold a hotkey, speak, release — the transcript lands in whatever field has focus.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/cask/fluidvoice" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://altic.dev/fluid" >}}

## What it does

FluidVoice is a push-to-talk dictation app. Audio is transcribed on-device, then optionally passed through a local language model that cleans up filler words, punctuation and casing before the text is inserted into the focused application.

Because both stages run locally, nothing is uploaded — which is the difference that matters when dictating into a private repository, a password manager note or a work document.

## Notes

- Needs **Microphone** and **Accessibility** permissions; the latter is what allows inserting text into another app.
- The app self-updates, so Homebrew's recorded version lags.
- Transcription quality tracks the model chosen in settings; the larger Whisper variants are noticeably better on technical vocabulary.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Wispr Flow](https://wisprflow.ai/) | Freemium | The best-known commercial dictation app; cloud transcription |
| [VoiceInk](https://tryvoiceink.com/) | Open source | Local |
| [Superwhisper](https://superwhisper.com/) | Freemium | Whisper-based, with local and cloud modes |
| macOS Dictation | Built in | Weaker on technical vocabulary and punctuation |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask fluidvoice
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://altic.dev/fluid)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://altic.dev/fluid" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/fluidvoice" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< /cards >}}
