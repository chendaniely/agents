# Global Agent Instructions

Read by all coding agents across every harness. This is the single source of
truth. If something is project-specific, it lives in the project's AGENTS.md
or CLAUDE.md instead.

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

**Example:**

```
feat(agents): 🤖 add agent tooling setup repo

Add Makefile with setup targets and Pi extension install script.

Harness: opencode v2.0.25
Model: qwen3.6-35b-a3b
Agent: qwen
Co-authored-by: Qwen-Coder <qwen-coder@alibabacloud.com>
```

## Making changes

1. Edit this file (it's the canonical source).
2. Run `make setup` in this repo to propagate changes.
3. Verify in each harness you use.
