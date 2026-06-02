---
title: "Markdown Preview"
description: "In-buffer markdown rendering with markview.nvim"
category: "plugins"
related:
  - README.md
  - ../reference/keybindings.md
---

# Markdown Preview

**Plugin:** `markview.nvim`

File: `lua/plugins/markview.lua`

Renders markdown directly in the buffer: styled headings, icon bullets,
checkboxes, callouts, tables drawn with box characters, and highlighted code
blocks. Uses the `markdown`, `markdown_inline`, `html`, and `yaml` treesitter
parsers already installed via `lua/plugins/treesitter.lua`.

## Behavior

- **Normal mode:** rendered preview; the node under the cursor shows raw
  markdown (hybrid mode) so it stays editable
- **Insert mode:** raw markdown everywhere
- **Icons:** provided by `nvim-web-devicons`

## Keybindings

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tm` | Normal | Toggle preview (current buffer) |
| `<leader>tM` | Normal | Toggle preview (all buffers) |
| `<leader>ts` | Normal | Toggle split preview window |

## Commands

```vim
:Markview toggle       " buffer-local toggle
:Markview Toggle       " global toggle
:Markview splitToggle  " read-only rendered split
```

## Related

- [Plugin Overview](README.md)
- [Keybinding Reference](../reference/keybindings.md)
