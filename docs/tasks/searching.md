---
title: "Searching"
description: "Finding files, content, and symbols with Telescope"
category: "tasks"
related:
  - README.md
  - navigation.md
---

# Searching

All search features use [Telescope](https://github.com/nvim-telescope/telescope.nvim).

## Find Files

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files in project |
| `<leader>fr` | Recent files |
| `<leader>fb` | List open buffers |

Hidden files are included (except `.git/`).

### Usage

1. Press `<leader>ff`
2. Type part of the filename
3. Use `Ctrl+j`/`Ctrl+k` to navigate
4. Press `Enter` to open

## Search in Files (Grep)

| Key | Action |
|-----|--------|
| `<leader>fg` | Live grep (search content) |
| `<leader>fc` | Grep word under cursor |

### Live Grep

1. Press `<leader>fg`
2. Type search pattern
3. Results update as you type
4. Navigate and select

### Search Current Word

1. Place cursor on a word
2. Press `<leader>fc`
3. See all occurrences across project

## Symbol Search

| Key | Action |
|-----|--------|
| `<leader>fs` | Document symbols (current file) |
| `<leader>fS` | Workspace symbols (all files) |
| `<leader>fd` | All diagnostics |

### Find a Function

1. Press `<leader>fs`
2. Type function name
3. Jump directly to it

## Help

| Key | Action |
|-----|--------|
| `<leader>fh` | Search help tags |

## Navigation Inside Telescope

| Key | Action |
|-----|--------|
| `Ctrl+j` | Move to next item |
| `Ctrl+k` | Move to previous item |
| `Enter` | Open selected |
| `Ctrl+x` | Open in horizontal split |
| `Ctrl+v` | Open in vertical split |
| `Ctrl+t` | Open in new tab |
| `Ctrl+q` | Send all to quickfix |
| `Esc` | Close Telescope |

## Advanced Telescope Commands

```vim
:Telescope commands      " Available commands
:Telescope keymaps       " All keymaps
:Telescope git_commits   " Git commit history
:Telescope git_branches  " Git branches
:Telescope highlights    " Highlight groups
```

## Sending to Quickfix

To act on multiple results:

1. Search with `<leader>fg` or similar
2. Press `Ctrl+q` to send all matches to quickfix
3. Navigate quickfix with `:cnext`, `:cprev`
4. Use quickfix for multi-file changes

## Troubleshooting

### No Results

1. Check you're in the right directory: `:pwd`
2. Ensure `ripgrep` is installed: `which rg`
3. File might be gitignored

### Slow Performance

1. Check telescope-fzf-native: `:checkhealth telescope`
2. Rebuild if needed: `:Lazy build telescope-fzf-native.nvim`

## Related

- [Navigation](navigation.md) - Moving through results
- [plugins/telescope.md](../plugins/telescope.md) - Configuration details
