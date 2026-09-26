---
title: "AI & Local Models"
weight: 1
description: "Local model runners and on-device speech tools."
---

{{< lead >}}Models that run on your own hardware rather than someone else's — an LLM server, and two dictation apps that transcribe locally.{{< /lead >}}

The common thread is that inference happens locally. Apple Silicon's unified memory makes a Mac a credible inference host, which is the same argument as self-hosting anything else — no per-token cost, no rate limit, and nothing leaves the machine.

{{< cards cols="3" >}}
{{< card link="ollama" title="Ollama" icon="cube-transparent" subtitle="Run large language models locally." >}}
{{< card link="fluidvoice" title="FluidVoice" icon="microphone" subtitle="Offline voice-to-text dictation with AI cleanup." >}}
{{< card link="voicebox" title="Voicebox" icon="volume-up" subtitle="Open-source local voice studio: dictation, TTS and voice cloning." >}}
{{< /cards >}}
