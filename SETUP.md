# Global Agent Files Setup

This file explains how to symlink the global agent files to each harness.

## Quick start

```bash
make setup
```

This creates symlinks from each harness's global config directory to the files
in this repo. If a symlink already exists, it is updated in place.

## What gets linked

| Harness | File | Global destination |
|---------|------|--------------------|
| Claude Code | `AGENTS.md` | `~/.claude/CLAUDE.md` |
| OpenCode | `AGENTS.md` | `~/.config/opencode/AGENTS.md` |
| Codex CLI | `AGENTS.md` | `~/.codex/AGENTS.md` |
| Pi | `AGENTS.md` | `~/.pi/agent/AGENTS.md` |
| Pi | `APPEND_SYSTEM.md` | `~/.pi/agent/APPEND_SYSTEM.md` |
| Hermes | `AGENTS.md` | `~/.hermes/AGENTS.md` |

## Manual setup

Run each command individually:

```bash
# Claude Code
ln -sf ~/git/hub/agents/CLAUDE.md ~/.claude/CLAUDE.md

# OpenCode
ln -sf ~/git/hub/agents/AGENTS.md ~/.config/opencode/AGENTS.md

# Codex CLI
ln -sf ~/git/hub/agents/AGENTS.md ~/.codex/AGENTS.md

# Pi
ln -sf ~/git/hub/agents/AGENTS.md ~/.pi/agent/AGENTS.md
ln -sf ~/git/hub/agents/APPEND_SYSTEM.md ~/.pi/agent/APPEND_SYSTEM.md

# Hermes
ln -sf ~/git/hub/agents/AGENTS.md ~/.hermes/AGENTS.md
```

## Removing the links

```bash
make teardown
```

This removes all symlinks created by `make setup`.
