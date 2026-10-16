#!/usr/bin/env bash
# Symlink global agent files from this repo to each harness.
# Usage: make setup (calls this script) or run directly.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LINKS=(
    "claude:CLAUDE.md:~/.claude"
    "opencode:AGENTS.md:~/.config/opencode"
    "codex:AGENTS.md:~/.codex"
    "pi:AGENTS.md:~/.pi/agent"
    "pi:APPEND_SYSTEM.md:~/.pi/agent"
    "hermes:AGENTS.md:~/.hermes"
)

echo "=== Linking global agent files ==="

for entry in "${LINKS[@]}"; do
    IFS=':' read -r harness src dest <<< "$entry"
    target="${dest}/${src}"

    # Create parent directory if it doesn't exist
    mkdir -p "$dest"

    # Create or update symlink
    ln -sf "$REPO_DIR/${src}" "$target"
    echo "  ${harness}: ${src} -> ${target}"
done

echo ""
echo "Done. Restart any running harnesses."
