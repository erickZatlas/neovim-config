---
title: "Neovim Configuration"
description: "A modular Neovim configuration for multi-language development"
category: "core"
---

# Neovim Configuration

A modular, feature-rich Neovim configuration for **Kotlin**, **Java**, **Python**, **JavaScript**, and **TypeScript** development.

## Features

- **LSP Integration** - Auto-installed language servers with Mason
- **Smart Completion** - Context-aware autocompletion with snippets
- **Debugging** - Full DAP support for JVM debugging
- **Git Integration** - Hunk staging, blame, and diff viewing
- **Fuzzy Finding** - Telescope with ripgrep and FZF
- **Format on Save** - Consistent code style across languages
- **Modern UI** - Tokyo Night theme, statusline, indent guides

## Quick Navigation

### Getting Started

- [Installation & Setup](getting-started.md)
- [Architecture Overview](architecture.md)
- [Keybinding Reference](keybindings.md)

### Plugins

- [Plugin Overview](plugins/README.md)
- [LSP & Mason](plugins/lsp.md)
- [Completion](plugins/completion.md)
- [Telescope](plugins/telescope.md)
- [Debugging](plugins/debugging.md)
- [Git Integration](plugins/git.md)
- [Editor Utilities](plugins/editor.md)
- [UI Enhancements](plugins/ui.md)

### Language Support

- [Language Overview](languages/README.md)
- [Kotlin](languages/kotlin.md)
- [Java](languages/java.md)
- [Python](languages/python.md)
- [TypeScript/JavaScript](languages/typescript.md)

## Key Bindings at a Glance

| Prefix | Category |
|--------|----------|
| `<leader>f` | Find (Telescope) |
| `<leader>d` | Debug |
| `<leader>h` | Git hunks |
| `<leader>x` | Diagnostics |
| `g` | Go to (LSP navigation) |

See [Keybinding Reference](keybindings.md) for the complete list.

## Project Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua   # Editor settings
│   │   └── keymaps.lua   # Global keybindings
│   └── plugins/          # Plugin configurations
└── docs/                 # This documentation
```

## Related

- [Getting Started](getting-started.md)
- [Architecture](architecture.md)
