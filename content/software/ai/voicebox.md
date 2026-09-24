---
title: "Voicebox"
weight: 3
description: "Open-source local voice studio: dictation, TTS and voice cloning."
---

{{< lead >}}Whisper dictation plus local text-to-speech and voice cloning, all on-device.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://voicebox.sh/" >}}

## What it does

Voicebox is an open-source voice studio for macOS that covers both directions of speech:

- **Dictation** — hold a hotkey anywhere, speak, release, and the transcript is pasted into the focused field. Transcription is OpenAI Whisper running locally, with optional cleanup by a local LLM.
- **Synthesis and cloning** — generate speech through a choice of local TTS engines, and clone a voice from a sample to reuse it.
- **Captures** — a paired archive of audio plus transcript, so a recording can be re-transcribed or refined later.
- **MCP** — it exposes itself to MCP-aware agents, so an agent can speak through one of your voices.

## Notes

Not in Homebrew; download from the project site or build from the repository. Models are downloaded on first use and are large.

{{< callout type="warning" >}}
Voice cloning has real misuse potential. Clone voices you own or have explicit permission to use, and be aware that synthetic speech impersonating a real person is illegal in a growing number of jurisdictions.
{{< /callout >}}

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [ElevenLabs](https://elevenlabs.io/) | Freemium | The commercial standard for TTS and voice cloning; cloud only |
| [FluidVoice](/software/ai/fluidvoice/) or [Superwhisper](https://superwhisper.com/) | Open source / Freemium | Dictation only, without the synthesis half |
| [Piper](https://github.com/OHF-Voice/piper1-gpl) or [Kokoro](https://huggingface.co/hexgrad/Kokoro-82M) on their own | Open source | Local TTS engines without the surrounding app |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Direct download" selected=true >}}

[Download from voicebox.sh](https://voicebox.sh/)

{{< /tab >}}
{{< tab name="Build from source" >}}

```shell
git clone https://github.com/jamiepine/voicebox
cd voicebox
# follow the build instructions in the README
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://voicebox.sh/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://github.com/jamiepine/voicebox" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://docs.voicebox.sh/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
