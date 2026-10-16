# Agent Commit Conventions

Every commit must follow these rules. Read this file before writing any commit.

## References

- **Semantic line breaks:** https://sembr.org/ — one idea per line in all plain text,
  markdown, and commit messages. Wrap at 72 characters.
- **Conventional Commits:** https://www.conventionalcommits.org/ — type, scope, and
  description format.

## Semantic line break rules

- Each line contains one idea.
- Wrap at 72 characters.
- Use a blank line to separate logical blocks.
- In commit messages, the subject line is one line. Each body sentence is one line.

## Format

```
type(scope): 🤖 description

body (optional, one sentence per line)

Harness: <harness name> v<version>
Model: <model id>
Agent: <agent name>
Co-authored-by: <bot name> <email>
```

## Rules

### Type and scope (always present)

- **Type:** `feat`, `fix`, `docs`, `chore`, `refactor`, `test`, `ci`
- **Scope:** the subsystem or file being touched. For a repo's own setup, use the repo name.

### Description (always starts with 🤖)

When an agent writes the commit, the description always starts with the 🤖 emoji.

```
feat(agents): 🤖 add commit conventions doc
```

### Footer order (strict)

Trailer lines go at the bottom, **in this exact order**:

1. **Harness** — the harness running the agent, with version
2. **Model** — the model id
3. **Agent** — the agent name (e.g., `qwen`, `claude`)
4. **Co-authored-by** — **must be the last line** of the commit message, or GitHub will not recognize it

```
Harness: opencode v2.0.25
Model: qwen3.6-35b-a3b
Agent: qwen
Co-authored-by: Qwen-Coder <qwen-coder@alibabacloud.com>
```

### Model → email mapping

| Model | Email |
|-------|-------|
| Claude | `noreply@anthropic.com` |
| Qwen-Coder | `qwen-coder@alibabacloud.com` |
| Codex | `noreply@openai.com` |
| Gemma4 | `noreply@google.com` |

### Examples

**Agent commit:**

```
feat(agents): 🤖 add agent tooling setup repo

Add Makefile with setup targets and Pi extension install script.

Harness: opencode v2.0.25
Model: qwen3.6-35b-a3b
Agent: qwen
Co-authored-by: Qwen-Coder <qwen-coder@alibabacloud.com>
```

**Human commit:**

```
docs: clarify OpenCode setup steps

```

## Verification

After writing the commit message, check:

1. Type and scope present?
2. Description starts with 🤖 (agent commits)?
3. Harness, Model, Agent lines present?
4. Co-authored-by is the **last** line?
5. Email matches the model being used?
