---
title: "Ollama"
weight: 1
description: "Run large language models locally."
---

{{< lead >}}Pulls quantised models and serves them over a local HTTP API, with a menu bar app and a CLI.{{< /lead >}}

{{< badge content="Homebrew cask" color="blue" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/cask/ollama-app" >}} {{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" link="https://formulae.brew.sh/formula/ollama" >}} {{< badge content="Direct download" color="orange" icon="iconify:charm/download" link="https://ollama.com/download" >}}

## What it does

Ollama is a model runner: `ollama pull` fetches a quantised model, `ollama run` gives you a chat prompt, and a local server on `127.0.0.1:11434` exposes an HTTP API that other tools point at. Models are described by a `Modelfile` — base model, system prompt, parameters — which makes a customised variant a three-line text file.

```shell
ollama pull llama3.2
ollama run qwen2.5-coder:7b
ollama list
curl http://localhost:11434/api/generate -d '{"model":"llama3.2","prompt":"hi"}'
```

On Apple Silicon it uses Metal, and unified memory means the usable model size is roughly "RAM minus what you are using" — a 32 GB Mac comfortably runs 7B–14B models quantised.

## Two installs, one thing

The **cask** (`ollama-app`) installs the menu bar app with a chat window and a bundled server. The **formula** installs just the CLI and server binary, which is what you want if you run it under `launchd` or only ever call the API. Installing both leaves two copies of the binary, so pick one.

## Notes

The API is OpenAI-compatible at `/v1`, so most clients written against OpenAI work by changing the base URL. Models land in `~/.ollama/models` and are large — check that before wondering where the disk went.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [LM Studio](https://lmstudio.ai/) | Free | A graphical model browser and chat client over the same GGUF models |
| [llama.cpp](https://github.com/ggml-org/llama.cpp) | Open source | The inference engine Ollama wraps; more control, more flags |
| [Jan](https://jan.ai/) and [GPT4All](https://www.nomic.ai/gpt4all) | Free | Desktop apps aimed at running local models with no terminal |
| [vLLM](https://docs.vllm.ai/) | Open source | The serious serving option when throughput and batching matter more than convenience |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install --cask ollama-app   # menu bar app + server
brew install ollama               # CLI and server only
```

{{< /tab >}}
{{< tab name="Direct download" >}}

[Download from the developer](https://ollama.com/download)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://ollama.com/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/cask/ollama-app" title="Homebrew cask" icon="cube" subtitle="Cask definition and versions" >}}
{{< card link="https://formulae.brew.sh/formula/ollama" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/ollama/ollama" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://github.com/ollama/ollama/blob/main/docs/api.md" title="Documentation" icon="book-open" subtitle="HTTP API reference" >}}
{{< /cards >}}
