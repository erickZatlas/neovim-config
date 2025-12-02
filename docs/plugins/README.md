---
title: "Plugin Overview"
description: "Overview of all installed plugins"
category: "plugins"
related:
  - ../README.md
  - ../architecture.md
---

# Plugin Overview

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management with automatic lazy-loading.

## Plugin Categories

### Core Functionality

| Plugin | Purpose | Documentation |
|--------|---------|---------------|
| [nvim-lspconfig](lsp.md) | Language Server Protocol | [LSP](lsp.md) |
| [mason.nvim](lsp.md) | LSP/tool package manager | [LSP](lsp.md) |
| [nvim-cmp](completion.md) | Autocompletion | [Completion](completion.md) |
| [nvim-treesitter](../architecture.md) | Syntax highlighting | - |

### Navigation & Search

| Plugin | Purpose | Documentation |
|--------|---------|---------------|
| [telescope.nvim](telescope.md) | Fuzzy finder | [Telescope](telescope.md) |
| [neo-tree.nvim](../keybindings.md) | File explorer | - |
| [bufferline.nvim](ui.md) | Buffer tabs | [UI](ui.md) |

### Development Tools

| Plugin | Purpose | Documentation |
|--------|---------|---------------|
| [nvim-dap](debugging.md) | Debugging | [Debugging](debugging.md) |
| [conform.nvim](../languages/README.md) | Formatting | [Languages](../languages/README.md) |
| [nvim-lint](../languages/README.md) | Linting | [Languages](../languages/README.md) |
| [gitsigns.nvim](git.md) | Git integration | [Git](git.md) |

### Editing

| Plugin | Purpose | Documentation |
|--------|---------|---------------|
| [nvim-autopairs](editor.md) | Auto-close brackets | [Editor](editor.md) |
| [Comment.nvim](editor.md) | Toggle comments | [Editor](editor.md) |
| [nvim-surround](editor.md) | Surround text objects | [Editor](editor.md) |
| [vim-illuminate](editor.md) | Highlight word under cursor | [Editor](editor.md) |

### UI

| Plugin | Purpose | Documentation |
|--------|---------|---------------|
| [tokyonight.nvim](ui.md) | Color scheme | [UI](ui.md) |
| [lualine.nvim](ui.md) | Status line | [UI](ui.md) |
| [indent-blankline.nvim](ui.md) | Indent guides | [UI](ui.md) |
| [todo-comments.nvim](ui.md) | TODO highlighting | [UI](ui.md) |
| [trouble.nvim](ui.md) | Diagnostics list | [UI](ui.md) |
| [which-key.nvim](ui.md) | Keybinding hints | [UI](ui.md) |
| [alpha-nvim](ui.md) | Dashboard | [UI](ui.md) |

## Plugin Management

### View Installed Plugins

```vim
:Lazy
```

### Update Plugins

```vim
:Lazy update
```

### Sync Plugins (Install/Clean)

```vim
:Lazy sync
```

### Plugin Health Check

```vim
:checkhealth lazy
```

## Adding a New Plugin

Create a new file in `lua/plugins/`:

```lua
-- lua/plugins/myplugin.lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",
    opts = {
      -- plugin options
    },
  },
}
```

See [Architecture](../architecture.md) for details on plugin specs.

## Related

- [Architecture](../architecture.md) - Plugin system details
- [LSP](lsp.md) - Language server setup
- [Completion](completion.md) - Autocompletion
