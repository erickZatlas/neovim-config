---
title: "Getting Started"
description: "Installation and first steps with the Neovim configuration"
category: "core"
related:
  - README.md
  - architecture.md
---

# Getting Started

## Prerequisites

- **Neovim** >= 0.9.0
- **Git** - For cloning and plugin management
- **A Nerd Font** - For icons (recommended: JetBrains Mono Nerd Font)

## Installation

### 1. Clone the Repository

```bash
git clone git@github.com:ersantana361/neovim-config.git ~/.config/nvim
```

### 2. Install System Dependencies

#### Required

```bash
# ripgrep - Required for Telescope file searching
sudo apt install ripgrep
```

#### Recommended

```bash
# fd - Faster file finding (optional)
sudo apt install fd-find

# xclip - System clipboard support
sudo apt install xclip
```

### 3. First Launch

```bash
nvim
```

On first launch:
1. **lazy.nvim** will auto-install itself
2. All plugins will be downloaded and installed
3. **Mason** will install language servers and tools

This may take a few minutes on the first run.

## Verifying Installation

### Check Plugin Status

```vim
:Lazy
```

Shows all installed plugins and their status.

### Check LSP Status

```vim
:Mason
```

Verify language servers are installed:
- `kotlin_language_server`
- `jdtls`
- `pyright`
- `typescript-language-server`

### Check Health

```vim
:checkhealth
```

Identifies any configuration issues.

## First Steps

### 1. Open a File

```bash
nvim myfile.kt
```

### 2. Try Telescope

Press `<Space>ff` to find files in the current directory.

### 3. Explore Keybindings

Press `<Space>` and wait - **which-key** will show available commands.

### 4. Open File Explorer

Press `<Space>e` to toggle the file tree.

## Customization

### Adding a Plugin

Create a new file in `lua/plugins/`:

```lua
-- lua/plugins/myplugin.lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",
    opts = {},
  },
}
```

See [Architecture](architecture.md) for details on the plugin system.

### Changing the Theme

Edit `lua/plugins/colorscheme.lua`:

```lua
opts = {
  style = "storm",  -- Options: night, storm, day, moon
},
```

## Troubleshooting

### Plugins Not Loading

```vim
:Lazy sync
```

### LSP Not Working

1. Check Mason: `:Mason`
2. Check LSP status: `:LspInfo`
3. Check logs: `:LspLog`

### Icons Not Displaying

Install a Nerd Font and configure your terminal to use it.

## Related

- [Architecture](architecture.md) - Understanding the configuration structure
- [Keybindings](keybindings.md) - Complete keybinding reference
- [Plugin Overview](plugins/README.md) - All installed plugins
