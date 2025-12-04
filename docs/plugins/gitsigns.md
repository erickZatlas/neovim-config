---
title: "Git Integration"
description: "Git signs, hunks, blame, and diffs with gitsigns.nvim"
category: "plugins"
related:
  - README.md
  - ../reference/keybindings.md
---

# Git Integration

File: `lua/plugins/gitsigns.lua`

## Overview

[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) provides:
- Git status signs in the gutter
- Hunk-level staging and reset
- Inline blame
- Diff viewing

## Gutter Signs

Signs appear in the sign column to show changes:

| Sign | Meaning |
|------|---------|
| `│` (green) | Added lines |
| `│` (blue) | Changed lines |
| `_` | Deleted line (below) |
| `‾` | Deleted line (above) |
| `~` | Changed and deleted |
| `┆` | Untracked file |

## Keybindings

### Navigation

| Key | Action |
|-----|--------|
| `]h` | Jump to next hunk |
| `[h` | Jump to previous hunk |

### Staging

| Key | Mode | Action |
|-----|------|--------|
| `<leader>hs` | Normal | Stage hunk under cursor |
| `<leader>hs` | Visual | Stage selected lines |
| `<leader>hS` | Normal | Stage entire buffer |
| `<leader>hu` | Normal | Undo stage hunk |

### Reset

| Key | Mode | Action |
|-----|------|--------|
| `<leader>hr` | Normal | Reset hunk under cursor |
| `<leader>hr` | Visual | Reset selected lines |
| `<leader>hR` | Normal | Reset entire buffer |

### Viewing

| Key | Action |
|-----|--------|
| `<leader>hp` | Preview hunk in floating window |
| `<leader>hb` | Show full blame for line |
| `<leader>hd` | Diff this file against index |
| `<leader>hD` | Diff against last commit |

### Toggles

| Key | Action |
|-----|--------|
| `<leader>tb` | Toggle line blame (inline) |
| `<leader>td` | Toggle showing deleted lines |

## Common Workflows

### Stage Specific Changes

1. Navigate to a hunk: `]h` or `[h`
2. Preview the change: `<leader>hp`
3. Stage if desired: `<leader>hs`
4. Repeat for other hunks

### Partial Line Staging

1. Enter visual mode: `v` or `V`
2. Select specific lines
3. Stage selection: `<leader>hs`

### Review Changes Before Commit

1. View diff: `<leader>hd`
2. Navigate hunks: `]h` / `[h`
3. Preview each: `<leader>hp`
4. Stage approved changes: `<leader>hs`

### Undo a Staged Hunk

1. If you accidentally staged a hunk
2. Use: `<leader>hu` to unstage
3. Changes return to working directory

### Quick Blame

1. Enable line blame: `<leader>tb`
2. Blame appears at end of each line
3. Shows: author, date, commit message
4. Toggle off when done: `<leader>tb`

### Full Blame Details

1. Position cursor on line
2. Press `<leader>hb`
3. See full commit information

## Hunk Preview

When you press `<leader>hp`:

```
┌─────────────────────────────┐
│ @@ -10,3 +10,5 @@           │
│  unchanged line             │
│ -removed line               │
│ +added line                 │
│ +another added line         │
│  unchanged line             │
└─────────────────────────────┘
```

## Diff View

When you press `<leader>hd`:
- Opens a diff split
- Left: index (staged)
- Right: working directory
- Navigate with `]h` / `[h`

## Configuration Details

```lua
signs = {
  add          = { text = "│" },
  change       = { text = "│" },
  delete       = { text = "_" },
  topdelete    = { text = "‾" },
  changedelete = { text = "~" },
  untracked    = { text = "┆" },
},
```

## Integration with Git Commands

While gitsigns handles staging, you'll still use git for:
- Committing: `git commit`
- Pushing: `git push`
- Branching: `git checkout -b`

Consider using a terminal within Neovim or an external git tool.

## Troubleshooting

### Signs Not Showing

1. Ensure you're in a git repository
2. Check: `:Gitsigns debug_messages`
3. Verify sign column is visible: `:set signcolumn?`

### Blame Not Working

1. Ensure file is tracked by git
2. File must have commits

### Slow in Large Repos

Gitsigns watches the git directory with a 1000ms interval. For very large repos, this is usually sufficient.

## Related

- [Git Guide](../tasks/git.md) - Usage guide
- [Keybindings](../reference/keybindings.md) - Full keybinding reference
- [UI Enhancements](ui.md) - Status line integration
