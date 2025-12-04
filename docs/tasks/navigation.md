---
title: "Navigation"
description: "Moving around windows, buffers, and code"
category: "tasks"
related:
  - README.md
  - code-intelligence.md
---

# Navigation

## Window Management

Move between split windows:

| Key | Action |
|-----|--------|
| `Ctrl+h` | Move to left window |
| `Ctrl+j` | Move to down window |
| `Ctrl+k` | Move to up window |
| `Ctrl+l` | Move to right window |

Resize windows:

| Key | Action |
|-----|--------|
| `Ctrl+Up` | Decrease height |
| `Ctrl+Down` | Increase height |
| `Ctrl+Left` | Decrease width |
| `Ctrl+Right` | Increase width |

## Buffer Navigation

Buffers appear as tabs at the top (via bufferline.nvim).

| Key | Action |
|-----|--------|
| `Shift+h` or `bp` | Previous buffer |
| `Shift+l` or `bn` | Next buffer |
| `bc` | Close current buffer |
| `<leader>ba` | New empty buffer |
| `<leader>bi` | Pin/unpin buffer |
| `<leader>bx` | Close all other buffers |
| `<leader>fb` | List buffers (Telescope) |

The `<leader>b` prefix also works: `<leader>bn`, `<leader>bp`, `<leader>bc`.

Pinned buffers stay on the left side of the tab bar.

## Code Navigation

Jump to definitions, references, and implementations (requires LSP):

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `<leader>cd` | Go to type definition |

### Usage Example

1. Place cursor on a function call
2. Press `gd` to jump to its definition
3. Press `Ctrl+o` to jump back

## Jump History

Neovim tracks your cursor positions. Navigate through them:

| Key | Action |
|-----|--------|
| `Ctrl+o` | Jump back (previous location) |
| `Ctrl+i` | Jump forward (next location) |

Use `Ctrl+o` after any jump (`gd`, `gr`, search results, etc.) to return.

## Reference Navigation

Navigate between occurrences of the word under cursor (via illuminate):

| Key | Action |
|-----|--------|
| `]]` | Next reference |
| `[[` | Previous reference |

Words are highlighted automatically when you pause on them.

## Diagnostic Navigation

Jump between errors and warnings:

| Key | Action |
|-----|--------|
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |

See [Code Intelligence](code-intelligence.md) for diagnostic details.

## File Explorer

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle Neo-tree |
| `<leader>o` | Focus Neo-tree |

## Quickfix and Location Lists

After a search or diagnostic collection:

| Key | Action |
|-----|--------|
| `<leader>xq` | Toggle quickfix list |
| `<leader>xl` | Set location list from diagnostics |

Navigate quickfix/location items with `:cnext`, `:cprev`, `:lnext`, `:lprev`.

## Related

- [Searching](searching.md) - Find files and content
- [Code Intelligence](code-intelligence.md) - LSP features
