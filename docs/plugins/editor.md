---
title: "Editor Utilities"
description: "Autopairs, comments, surround, and word highlighting"
category: "plugins"
related:
  - README.md
  - completion.md
---

# Editor Utilities

File: `lua/plugins/editing.lua`

## Plugins

- **nvim-autopairs** - Auto-close brackets and quotes
- **Comment.nvim** - Toggle comments
- **nvim-surround** - Add/change/delete surroundings
- **vim-illuminate** - Highlight word under cursor

---

## Auto Pairs

Automatically closes brackets, quotes, and parentheses.

### Behavior

| You type | Result |
|----------|--------|
| `(` | `()` with cursor inside |
| `{` | `{}` with cursor inside |
| `[` | `[]` with cursor inside |
| `"` | `""` with cursor inside |
| `'` | `''` with cursor inside |

### Smart Features

- **Treesitter-aware**: Respects syntax context
- **Skip closing**: Typing `)` when on `)` moves cursor right
- **Fast wrap**: `<M-e>` wraps next word in pairs

### Fast Wrap Example

```
cursor here|word
```

Press `<M-e>` then `(`:

```
(word)|
```

---

## Comments

Toggle comments with `gc` operator.

### Keybindings

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | Normal | Toggle line comment |
| `gbc` | Normal | Toggle block comment |
| `gc{motion}` | Normal | Comment with motion |
| `gc` | Visual | Comment selection |
| `gb` | Visual | Block comment selection |

### Examples

**Comment a line:**
```
gcc
```

**Comment 3 lines:**
```
gc3j
```

**Comment a paragraph:**
```
gcip
```

**Comment selection:**
1. Visual select lines
2. Press `gc`

### Language-Aware

Uses `nvim-ts-context-commentstring` for correct comment syntax in:
- JSX/TSX (different comments in different contexts)
- HTML with embedded scripts
- Vue/Svelte templates

---

## Surround

Add, change, or delete surrounding characters.

### Add Surroundings

| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surrounding |
| `yss{char}` | Surround entire line |
| `yS{motion}{char}` | Add on new lines |

### Examples

**Surround word with quotes:**
```
ysiw"
```

Before: `hello`
After: `"hello"`

**Surround word with parentheses:**
```
ysiw)
```

Before: `hello`
After: `(hello)`

**Surround to end of line:**
```
ys$"
```

### Change Surroundings

| Key | Action |
|-----|--------|
| `cs{old}{new}` | Change surrounding |

**Change quotes:**
```
cs"'
```

Before: `"hello"`
After: `'hello'`

**Change brackets:**
```
cs)]
```

Before: `(hello)`
After: `[hello]`

### Delete Surroundings

| Key | Action |
|-----|--------|
| `ds{char}` | Delete surrounding |

**Delete quotes:**
```
ds"
```

Before: `"hello"`
After: `hello`

### Visual Mode

1. Select text in visual mode
2. Press `S`
3. Enter surrounding character

---

## Illuminate

Highlights all occurrences of the word under cursor.

### Behavior

- Waits 200ms before highlighting
- Uses LSP for smart matching when available
- Falls back to exact word match
- Optimized for large files (>2000 lines uses LSP only)

### Keybindings

| Key | Action |
|-----|--------|
| `]]` | Jump to next reference |
| `[[` | Jump to previous reference |

### Use Cases

**Find variable usage:**
1. Place cursor on variable name
2. All uses highlight automatically
3. Navigate with `]]` / `[[`

**Understand scope:**
- Quickly see where a symbol is used
- Identify if a variable is used elsewhere

### Disabled Filetypes

Illuminate is disabled in:
- alpha (dashboard)
- neo-tree (file explorer)
- Trouble (diagnostics)
- lazy (plugin manager)
- mason (tool installer)

---

## Configuration Tips

### Disable Autopairs for Specific Filetypes

```lua
require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})
```

### Custom Surround Pairs

```lua
require("nvim-surround").setup({
  surrounds = {
    ["("] = { add = { "(", ")" } },
    [")"] = { add = { "( ", " )" } },  -- With spaces
  },
})
```

### Adjust Illuminate Delay

```lua
require("illuminate").configure({
  delay = 100,  -- Faster highlighting
})
```

## Related

- [Completion](completion.md) - Autopairs integrates with completion
- [Keybindings](../keybindings.md) - Full keybinding reference
