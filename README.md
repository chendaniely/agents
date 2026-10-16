# Agent Tooling Setup

One-command setup for interactive decision-making tools across Pi and OpenCode.

## What this repo holds

- **`AGENTS.md`** — Canonical global instructions for all coding agents
- **`CLAUDE.md`** — Thin wrapper that imports AGENTS.md (Claude Code compatibility)
- **`APPEND_SYSTEM.md`** — Pi-specific behavioral rules appended to system prompt
- **`Makefile`** — `make setup` installs tooling
- **`scripts/setup-pi.sh`** — Installs Pi extensions (`pi-ask-user`, `pi-plans`)
- **`scripts/setup-global.sh`** — Symlink helper (see SETUP.md for instructions)
- **`docs/opencode-question-tool.md`** — Manual steps for OpenCode's built-in `question` tool
- **`SETUP.md`** — Manual instructions for linking global agent files to each harness

## Quick start

```bash
git clone https://github.com/chendaniely/agents.git ~/git/hub/agents
cd ~/git/hub/agents
make setup
```

## Components

### Pi: pi-ask-user

Interactive decision-gating extension. Lets the agent call `ask_user` with multiple-choice, multi-select, and freeform answers. Renders an overlay popup in the TUI.

**Features:**
- Searchable option lists with descriptions
- Multi-select and freeform answers
- Batch questions (2-4 independent questions at once)
- Keyboard navigation (tab, arrow keys, number shortcuts)
- Overlay toggle (`alt+o`) to read prior output

**Install:** `make pi-ask-user` or `make setup`

**Verify:** Run `/reload` in Pi, then ask the agent to use `ask_user`.

### Pi: pi-plans

Human-in-the-loop planning extension. Versioned Markdown plans with explicit human approval gates before execution.

**Features:**
- Plan → Review → Execute flow
- Native select menus for reviewer count and execution target
- Subagent-based reviewer rounds
- Task-tree execution with progress tracking

**Install:** `make pi-plans` or `make setup`

**Verify:** Run `/reload` in Pi, then start a plan with `/plans:init`.

### OpenCode: built-in question tool

OpenCode ships a `question` tool that pauses the agent to present options.

**What works:**
- Single question with options
- Custom answer entry
- Multi-select mode
- Batch questions (multiple independent questions)

**Limitations:**
- TUI only — Web/Desktop clients hang when triggered
- No SDK response API
- No OS notifications or overlay toggle

**Install:** `make opencode-question` or `make setup`

## Manual steps (not scripted)

### OpenCode config change

The `question` tool requires a permission entry in `opencode.json`:

```json
{
  "permission": {
    "question": "allow"
  }
}
```

Run `make opencode-question` to apply it automatically. If that fails, add the `permission` block to `~/.config/opencode/opencode.json` at the top level.

## Troubleshooting

| Issue | Fix |
|-------|-----|
| Pi extension not loaded | Run `/reload` in Pi |
| OpenCode question tool doesn't appear | Verify `opencode.json` has `"permission": { "question": "allow" }` |
| OpenCode question hangs in Web UI | Switch to TUI — Web client doesn't render the modal |
| Custom answer won't submit | Known bug (#30393). Work around: type answer, press Enter |
| Pi-ask-user options don't render | Ensure Pi TUI is active (not RPC/headless) |
