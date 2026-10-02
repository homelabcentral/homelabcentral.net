---
title: "FlowMoose"
weight: 5
description: "Hold fn, speak, and the text lands where the cursor is."
---

{{< lead >}}On-device dictation bound to the `fn` key, with a lock mode for anything longer than a sentence.{{< /lead >}}

{{< badge content="Direct download" color="orange" icon="iconify:charm/download" size="lg" link="https://flowmoose.app" >}}

## What it does

Hold `fn`, talk, release: the audio is transcribed locally with Whisper and pasted into whatever field has focus — Mail, Slack, Xcode, a terminal. A double-tap locks recording open for a monologue and a single tap ends it, which is the difference between dictating a reply and dictating a paragraph.

Language is detected per recording across ninety-odd languages, so switching mid-session needs no setting changed. Every dictation is kept in a local, searchable history to re-paste from, and the audio itself is deleted once transcribed.

It is the paid, polished end of the same shelf as [Handy](/software/ai/handy/) and [FluidVoice](/software/ai/fluidvoice/): one hotkey, no model management to speak of, and a licence instead of a repository.

## Notes

- €49 once, covering two Macs and all future updates, after a 7-day trial that needs no account. No subscription.
- **Apple Silicon only**, macOS 14 or later.
- Not on the App Store, and the reason is structural: pasting into any app needs Accessibility, which the App Sandbox forbids.
- No Homebrew cask — the `.dmg` comes from the site.

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Handy](/software/ai/handy/) | Open source | Free and extensible, with the model left to you |
| [Wispr Flow](https://wisprflow.ai/) | Freemium | The best-known commercial dictation app; cloud transcription |
| [Superwhisper](https://superwhisper.com/) | Freemium | Whisper-based, with local and cloud modes |
| [MacWhisper](https://goodsnooze.gumroad.com/l/macwhisper) | Freemium | Strong on transcribing files, less on live dictation |
| macOS Dictation | Built in | Free, and weaker on technical vocabulary and punctuation |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Direct download" selected=true >}}

[Download the .dmg from the project site](https://flowmoose.app)

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://flowmoose.app" title="flowmoose.app" icon="globe-alt" subtitle="Official site, pricing and roadmap" >}}
{{< card link="https://www.leanbytes.io/#flowmoose" title="leanbytes.io" icon="briefcase" subtitle="The vendor's product page" >}}
{{< /cards >}}
