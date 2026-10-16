# OpenCode: Enable Built-in question Tool

## What it does

Enables OpenCode's built-in `question` tool, which lets the agent pause during a task to present options to the user.

## Setup

### Automated

```bash
make opencode-question
```

### Manual

Edit `~/.config/opencode/opencode.json` and add a `permission` block at the top level:

```json
{
  "permission": {
    "question": "allow"
  },
  // ... rest of config unchanged
}
```

The key is the `question` key with value `"allow"`. This goes at the top level of the JSON object, same level as `plugins`, `instructions`, `provider`, etc.

## Verification

Start a new OpenCode session and ask the agent to "ask me a question with options". You should see a modal popup with selectable options and a text field for custom answers.

## Limitations

- TUI only — Web and Desktop clients do not render the modal (sessions hang)
- No SDK response API — execution hangs if triggered via SDK
- Intermittent freeze bugs reported in Warp mode (issues #27302, #30393, #48047)
