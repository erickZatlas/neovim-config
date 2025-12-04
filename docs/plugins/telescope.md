---
title: "Telescope"
description: "Fuzzy finder for files, grep, and more"
category: "plugins"
related:
  - README.md
  - lsp.md
---

# Telescope

File: `lua/plugins/telescope.lua`

## Overview

[Telescope](https://github.com/nvim-telescope/telescope.nvim) is a highly extensible fuzzy finder.

**Dependencies:**
- `plenary.nvim` - Lua utilities
- `telescope-fzf-native.nvim` - Native FZF sorter for performance

**System requirement:** `ripgrep` for file searching

## Keybindings

### File Finding

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fr` | Recent files |
| `<leader>fb` | List buffers |

### Searching

| Key | Action |
|-----|--------|
| `<leader>fg` | Live grep (search in files) |
| `<leader>fc` | Grep word under cursor |

### LSP Integration

| Key | Action |
|-----|--------|
| `<leader>fs` | Document symbols |
| `<leader>fS` | Workspace symbols |
| `<leader>fd` | Diagnostics |

### Help

| Key | Action |
|-----|--------|
| `<leader>fh` | Help tags |

## Navigation Inside Telescope

| Key | Mode | Action |
|-----|------|--------|
| `<C-j>` | Insert | Move to next item |
| `<C-k>` | Insert | Move to previous item |
| `<CR>` | Insert | Open selected |
| `<C-x>` | Insert | Open in horizontal split |
| `<C-v>` | Insert | Open in vertical split |
| `<C-t>` | Insert | Open in new tab |
| `<C-q>` | Insert | Send to quickfix list |
| `<Esc>` | Insert | Close Telescope |

## Configuration

### Hidden Files

Find files shows hidden files by default:

```lua
find_files = {
  hidden = true,
  find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
},
```

### FZF Sorting

Native FZF provides fast fuzzy matching:

```lua
extensions = {
  fzf = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case",
  },
},
```

## Common Use Cases

### Find a File

1. Press `<leader>ff`
2. Type part of the filename
3. Use `<C-j>`/`<C-k>` to navigate
4. Press `<CR>` to open

### Search in Files

1. Press `<leader>fg`
2. Type your search pattern
3. Results update live
4. Navigate and open as needed

### Find Symbol

1. Press `<leader>fs` (document) or `<leader>fS` (workspace)
2. Type symbol name
3. Jump directly to definition

### Search for Word Under Cursor

1. Position cursor on a word
2. Press `<leader>fc`
3. See all occurrences across files

## Extending Telescope

### Custom Picker

```lua
-- In your config or a custom file
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fn", function()
  builtin.find_files({ cwd = "~/.config/nvim" })
end, { desc = "Find Neovim config files" })
```

### Additional Pickers

Telescope has many built-in pickers:

```vim
:Telescope commands      " Available commands
:Telescope keymaps       " All keymaps
:Telescope highlights    " Highlight groups
:Telescope vim_options   " Vim options
:Telescope git_commits   " Git commit history
:Telescope git_branches  " Git branches
```

## Troubleshooting

### No Results in Find Files

1. Ensure `ripgrep` is installed: `which rg`
2. Check you're in the right directory: `:pwd`
3. Try without hidden files filter

### Slow Performance

1. Ensure `telescope-fzf-native` is compiled
2. Check: `:checkhealth telescope`
3. Limit search scope if needed

### FZF Extension Not Working

Rebuild the extension:

```vim
:Lazy build telescope-fzf-native.nvim
```

## Related

- [Searching Guide](../tasks/searching.md) - Usage guide
- [LSP](lsp.md) - Symbol search integration
- [Keybindings](../reference/keybindings.md) - Full keybinding reference
