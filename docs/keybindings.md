---
title: "Keybinding Reference"
description: "Complete keybinding reference for all modes"
category: "core"
related:
  - README.md
  - plugins/README.md
---

# Keybinding Reference

Leader key: `<Space>`

## Global Navigation

### Window Management

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | Normal | Move to left window |
| `<C-j>` | Normal | Move to down window |
| `<C-k>` | Normal | Move to up window |
| `<C-l>` | Normal | Move to right window |
| `<C-Up>` | Normal | Decrease window height |
| `<C-Down>` | Normal | Increase window height |
| `<C-Left>` | Normal | Decrease window width |
| `<C-Right>` | Normal | Increase window width |

### Buffer Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<S-h>` | Normal | Previous buffer |
| `<S-l>` | Normal | Next buffer |
| `<leader>bp` | Normal | Pin/unpin buffer |
| `<leader>bx` | Normal | Close all other buffers |
| `<leader>fb` | Normal | List buffers (Telescope) |

Buffers are displayed as tabs at the top of the screen via bufferline.nvim. Pinned buffers stay visible on the left.

### Visual Mode

| Key | Mode | Action |
|-----|------|--------|
| `<` | Visual | Indent left (stay in visual) |
| `>` | Visual | Indent right (stay in visual) |
| `J` | Visual | Move selection down |
| `K` | Visual | Move selection up |

## LSP

LSP keybindings only appear when a language server is attached (check `:LspInfo`).

### Navigation (g prefix)

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gr` | Normal | Go to references |
| `gi` | Normal | Go to implementation |
| `K` | Normal | Hover documentation |
| `<C-k>` | Normal | Signature help |
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |

### Jump History

| Key | Mode | Action |
|-----|------|--------|
| `<C-o>` | Normal | Jump back (previous location) |
| `<C-i>` | Normal | Jump forward (next location) |

Use `<C-o>` to return after jumping with `gd`, `gr`, or `gi`.

### Code Actions (leader c)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ca` | Normal | Code action |
| `<leader>cr` | Normal | Rename symbol |
| `<leader>cd` | Normal | Type definition |
| `<leader>co` | Normal | Organize imports |
| `<leader>cf` | Normal | Format buffer |
| `<leader>cl` | Normal | Lint buffer |

## Telescope (Find)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep |
| `<leader>fb` | Normal | List buffers |
| `<leader>fh` | Normal | Help tags |
| `<leader>fr` | Normal | Recent files |
| `<leader>fc` | Normal | Grep word under cursor |
| `<leader>fs` | Normal | Document symbols |
| `<leader>fS` | Normal | Workspace symbols |
| `<leader>fd` | Normal | Diagnostics |

### Inside Telescope

| Key | Mode | Action |
|-----|------|--------|
| `<C-j>` | Insert | Move to next item |
| `<C-k>` | Insert | Move to previous item |
| `<C-q>` | Insert | Send to quickfix |
| `<Esc>` | Insert | Close |

## Debugging

| Key | Mode | Action |
|-----|------|--------|
| `<leader>db` | Normal | Toggle breakpoint |
| `<leader>dB` | Normal | Conditional breakpoint |
| `<leader>dl` | Normal | Log point |
| `<leader>dc` | Normal | Continue |
| `<leader>di` | Normal | Step into |
| `<leader>do` | Normal | Step over |
| `<leader>dO` | Normal | Step out |
| `<leader>dr` | Normal | Restart |
| `<leader>dq` | Normal | Terminate |
| `<leader>du` | Normal | Toggle debug UI |
| `<leader>de` | Normal/Visual | Evaluate expression |
| `<leader>dR` | Normal | Toggle REPL |
| `<leader>dL` | Normal | Run last |

## Git

| Key | Mode | Action |
|-----|------|--------|
| `]h` | Normal | Next hunk |
| `[h` | Normal | Previous hunk |
| `<leader>hs` | Normal/Visual | Stage hunk |
| `<leader>hr` | Normal/Visual | Reset hunk |
| `<leader>hS` | Normal | Stage buffer |
| `<leader>hu` | Normal | Undo stage hunk |
| `<leader>hR` | Normal | Reset buffer |
| `<leader>hp` | Normal | Preview hunk |
| `<leader>hb` | Normal | Blame line (full) |
| `<leader>hd` | Normal | Diff this |
| `<leader>hD` | Normal | Diff against parent |
| `<leader>tb` | Normal | Toggle line blame |
| `<leader>td` | Normal | Toggle deleted |

## File Explorer

| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | Normal | Toggle Neo-tree |
| `<leader>o` | Normal | Focus Neo-tree |

## Diagnostics (Trouble)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>xf` | Normal | Show diagnostic float |
| `<leader>xl` | Normal | Set location list |
| `<leader>xx` | Normal | Toggle all diagnostics |
| `<leader>xX` | Normal | Toggle buffer diagnostics |
| `<leader>xs` | Normal | Toggle symbols |
| `<leader>xq` | Normal | Toggle quickfix |

## TODO Comments

| Key | Mode | Action |
|-----|------|--------|
| `]t` | Normal | Next TODO |
| `[t` | Normal | Previous TODO |
| `<leader>xt` | Normal | TODO list (Telescope) |

## Completion

| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Insert | Trigger completion |
| `<Tab>` | Insert | Next item / expand snippet |
| `<S-Tab>` | Insert | Previous item |
| `<CR>` | Insert | Confirm selection |
| `<C-e>` | Insert | Abort completion |
| `<C-b>` | Insert | Scroll docs up |
| `<C-f>` | Insert | Scroll docs down |

## Treesitter

| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Normal/Visual | Start/expand selection |
| `<BS>` | Visual | Shrink selection |

## Illuminate (Word References)

| Key | Mode | Action |
|-----|------|--------|
| `]]` | Normal | Next reference |
| `[[` | Normal | Previous reference |

## Leader Key Groups

| Prefix | Category |
|--------|----------|
| `<leader>b` | Buffer |
| `<leader>c` | Code |
| `<leader>d` | Debug |
| `<leader>f` | Find (Telescope) |
| `<leader>g` | Go to (vim g commands) |
| `<leader>G` | Git |
| `<leader>h` | Git Hunks |
| `<leader>t` | Toggle |
| `<leader>x` | Diagnostics |

Press `<leader>` and wait for which-key to show all options.

## Related

- [Plugin Overview](plugins/README.md)
- [LSP Documentation](plugins/lsp.md)
- [Debugging](plugins/debugging.md)
