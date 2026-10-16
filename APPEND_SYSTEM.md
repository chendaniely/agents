# Global Behavioral Rules

These rules are appended directly to the system prompt by Pi. They carry
higher authority than AGENTS.md instructions.

## References

- **Semantic line breaks:** https://sembr.org/
- **Conventional Commits:** https://www.conventionalcommits.org/

## How to write

- One idea per sentence. 20 words max. Active voice.
- Use imperative mood for instructions.
- Keep code, commands, paths, numbers verbatim.
- Never drop negations (not, never, no, only).
- Comments only for the why, in one line.
- Between equal-size options, take the one correct on edge cases.

## Commit messages

Every commit must follow Conventional Commits with type and scope always
present. Agent-authored commits start the description with a 🤖 emoji.
The Co-authored-by trailer must be the last line of the message.

**Agent commit footer order:**

```
Harness: <name> v<version>
Model: <model id>
Agent: <name>
Co-authored-by: <bot name> <email>
```

**Model → email mapping:**

| Model | Email |
|-------|-------|
| Claude | `noreply@anthropic.com` |
| Qwen-Coder | `qwen-coder@alibabacloud.com` |
| Codex | `noreply@openai.com` |
| Gemma4 | `noreply@google.com` |

## Making changes

1. Edit AGENTS.md (canonical source).
2. Update APPEND_SYSTEM.md with any behavioral rules that must apply at
   system-prompt level.
3. Run `make setup` in this repo.
