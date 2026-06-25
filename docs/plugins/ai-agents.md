---
title: "AI Agents"
description: "Claude Code and opencode coding agents embedded in the editor"
category: "plugins"
related:
  - README.md
  - ../reference/keybindings.md
---

# AI Agents

Files: `lua/plugins/claudecode.lua`, `lua/plugins/opencode.lua`

Two coding agents run inside Neovim on separate leader prefixes, so they never
collide: **Claude Code** on `<leader>a` ("AI") and **opencode** on `<leader>o`.
Both share [snacks.nvim](https://github.com/folke/snacks.nvim) for their
terminal, input, and picker UI.

## Claude Code

[coder/claudecode.nvim](https://github.com/coder/claudecode.nvim) is a pure-Lua
implementation of Claude Code's WebSocket MCP protocol. It does **not** embed a
chat UI — instead it lets the `claude` CLI connect to Neovim as its IDE.

### How the connection works

1. **Server** — Neovim opens a WebSocket server and writes a lock file to
   `~/.claude/ide/<pid>.lock` (containing the port, auth token, and workspace).
2. **Spawn** — `:ClaudeCode` (or `<leader>ac`) launches a fresh `claude` process
   in a snacks terminal split, with `CLAUDE_CODE_SSE_PORT` set to that port.
3. **Connect** — that `claude` dials the port. One Neovim window pairs with one
   Claude session.

A `claude` started in a plain terminal does **not** connect — it must be spawned
from inside Neovim. To confirm a live connection, run `/ide` inside the Claude
panel (it should report "Connected to Neovim"), or check from a shell:

```bash
ss -tnp | grep <port>   # shows an ESTABLISHED socket between claude and nvim
```

Once connected, Claude sees your current selection, can open buffers, and
presents proposed edits as **native Neovim diffs** you accept or reject.

### Keybindings

| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude panel |
| `<leader>af` | Focus Claude panel |
| `<leader>ar` | Resume a past session |
| `<leader>aC` | Continue last session |
| `<leader>am` | Select model |
| `<leader>ab` | Add current buffer to context |
| `<leader>as` | Send selection (visual) / add file from Neo-tree |
| `<leader>aa` | Accept proposed diff |
| `<leader>ad` | Deny proposed diff |

### Commands

| Command | Action |
|---------|--------|
| `:ClaudeCode` | Toggle the panel |
| `:ClaudeCodeFocus` | Focus the panel |
| `:ClaudeCodeSend` | Send the visual selection |
| `:ClaudeCodeAdd %` | Add the current buffer to context |
| `:ClaudeCodeSelectModel` | Pick the model |
| `:ClaudeCodeDiffAccept` / `:ClaudeCodeDiffDeny` | Resolve a proposed diff |

Requires the `claude` CLI on `PATH` (installed at `~/.local/bin/claude`).

## opencode

[NickvanDyke/opencode.nvim](https://github.com/NickvanDyke/opencode.nvim)
embeds the `opencode` agent TUI in a split and adds context-passing keymaps.
The model and API key live in `~/.config/opencode/opencode.jsonc` and the
`$DEEPSEEK_API_KEY` environment variable.

### Keybindings

| Key | Action |
|-----|--------|
| `<leader>oo` | Toggle opencode panel |
| `<leader>oa` | Ask about cursor (normal) / selection (visual) |
| `<leader>o+` | Append current buffer to prompt |
| `<leader>os` | Pick a prompt |
| `<leader>on` | New session |
| `<leader>oi` | Interrupt |
| `<leader>oe` | Explain selection (visual) |
| `<S-C-u>` / `<S-C-d>` | Scroll messages up / down |

## Which one to use

- **Claude Code** — agentic, multi-file edits with diff review; connects the
  full Claude Code CLI to the editor.
- **opencode** — lighter in-editor prompting against DeepSeek models; quick
  asks about the cursor or a selection.

## Related

- [Plugin Overview](README.md)
- [Keybinding Reference](../reference/keybindings.md)
