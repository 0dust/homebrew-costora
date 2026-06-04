# Costora Homebrew Tap

Install the Costora metadata-only local agent:

```bash
brew install 0dust/costora/costora-agent
costora-agent login
```

`costora-agent` collects allowlisted AI usage metadata for PR cost receipts. It must not collect prompts, completions, source files, diffs, transcripts, message bodies, raw JSONL, or raw OTEL payloads.
