---
title: "Git"
description: "Staging, hunks, blame, and diff with gitsigns"
category: "tasks"
related:
  - README.md
---

# Git

Git integration via [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim).

## Gutter Signs

Signs in the left column show changes:

| Sign | Meaning |
|------|---------|
| `│` (green) | Added lines |
| `│` (blue) | Changed lines |
| `_` | Deleted line below |
| `‾` | Deleted line above |
| `~` | Changed and deleted |
| `┆` | Untracked file |

## Hunk Navigation

| Key | Action |
|-----|--------|
| `]h` | Next hunk |
| `[h` | Previous hunk |

## Staging

| Key | Mode | Action |
|-----|------|--------|
| `<leader>hs` | Normal | Stage hunk under cursor |
| `<leader>hs` | Visual | Stage selected lines |
| `<leader>hS` | Normal | Stage entire buffer |
| `<leader>hu` | Normal | Undo stage hunk |

### Stage Specific Changes

1. Navigate to a hunk: `]h` or `[h`
2. Preview the change: `<leader>hp`
3. Stage if desired: `<leader>hs`
4. Repeat for other hunks

### Partial Line Staging

1. Enter visual mode: `v` or `V`
2. Select specific lines
3. Stage selection: `<leader>hs`

## Reset (Undo Changes)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>hr` | Normal | Reset hunk under cursor |
| `<leader>hr` | Visual | Reset selected lines |
| `<leader>hR` | Normal | Reset entire buffer |

**Warning:** Reset discards changes permanently.

## Preview and View

| Key | Action |
|-----|--------|
| `<leader>hp` | Preview hunk in popup |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |

### Hunk Preview

Shows added/removed lines in a floating window:

```
┌─────────────────────────────┐
│ @@ -10,3 +10,5 @@           │
│  unchanged line             │
│ -removed line               │
│ +added line                 │
└─────────────────────────────┘
```

## Blame

| Key | Action |
|-----|--------|
| `<leader>hb` | Full blame for current line |
| `<leader>tb` | Toggle inline blame |

### Inline Blame

Enable `<leader>tb` to see author and date at end of each line.

### Full Blame

Press `<leader>hb` on any line to see:
- Author name
- Commit date
- Full commit message

## Toggles

| Key | Action |
|-----|--------|
| `<leader>tb` | Toggle inline blame |
| `<leader>td` | Toggle deleted lines |

Show deleted toggles display of removed lines in place.

## Common Workflows

### Review Before Commit

1. View all changes: `<leader>hd`
2. Navigate hunks: `]h` / `[h`
3. Preview each: `<leader>hp`
4. Stage approved: `<leader>hs`
5. Commit via terminal: `git commit`

### Undo Accidental Stage

1. If you staged wrong hunk
2. Press `<leader>hu` to unstage
3. Changes return to working directory

### Find Who Changed a Line

1. Position on the line
2. Press `<leader>hb`
3. See commit info

## Git Commands

Gitsigns handles staging/viewing. Use terminal for:

```bash
git commit -m "message"
git push
git pull
git checkout -b branch
```

## Troubleshooting

### Signs Not Showing

1. Ensure you're in a git repo
2. Check: `:Gitsigns debug_messages`

### Blame Not Working

1. File must be tracked by git
2. File must have commits

## Related

- [plugins/gitsigns.md](../plugins/gitsigns.md) - Configuration details
