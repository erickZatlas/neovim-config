---
title: "Completion"
description: "Autocompletion with nvim-cmp and snippets"
category: "plugins"
related:
  - README.md
  - lsp.md
---

# Completion

File: `lua/plugins/completion.lua`

## Overview

This configuration uses:
- **nvim-cmp** - Completion engine
- **LuaSnip** - Snippet engine
- **friendly-snippets** - Pre-made VS Code-style snippets

## Completion Sources

Sources are prioritized in this order:

| Priority | Source | Description |
|----------|--------|-------------|
| 1000 | LSP | Language server completions |
| 750 | Snippets | LuaSnip snippets |
| 500 | Buffer | Words from current buffer |
| 250 | Path | File system paths |

## Keybindings

| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Insert | Trigger completion menu |
| `<Tab>` | Insert | Next item / expand snippet / jump forward |
| `<S-Tab>` | Insert | Previous item / jump backward |
| `<CR>` | Insert | Confirm selection |
| `<C-e>` | Insert | Abort/close completion |
| `<C-b>` | Insert | Scroll documentation up |
| `<C-f>` | Insert | Scroll documentation down |

## Completion Menu

The completion menu shows:

```
 method     [LSP]
 function   [Snippet]
 variable   [Buffer]
~/path      [Path]
```

- **Icon** - Kind indicator
- **Text** - Completion text
- **Source** - Where it came from

## Snippets

### Using Snippets

1. Type the snippet trigger (e.g., `fn`)
2. Select from completion menu
3. Press `<Tab>` to expand
4. Use `<Tab>`/`<S-Tab>` to jump between placeholders

### Available Snippets

Snippets come from `friendly-snippets` and include:
- Function/class templates
- Control flow structures
- Common patterns per language

### Example: Kotlin Function

Type `fun` and select:

```kotlin
fun name(params): ReturnType {
    // cursor here
}
```

Tab through `name`, `params`, `ReturnType`, and body.

## Configuration

### Changing Completion Behavior

In `lua/plugins/completion.lua`:

```lua
completion = {
  completeopt = "menu,menuone,noselect",
},
```

Options:
- `menu` - Show completion menu
- `menuone` - Show menu even with one item
- `noselect` - Don't auto-select first item
- `noinsert` - Don't auto-insert text

### Adding a New Source

```lua
sources = cmp.config.sources({
  { name = "nvim_lsp", priority = 1000 },
  { name = "luasnip", priority = 750 },
  { name = "buffer", priority = 500 },
  { name = "path", priority = 250 },
  { name = "new_source", priority = 100 },  -- Add here
}),
```

### Custom Snippets

Create `~/.config/nvim/snippets/` and add snippet files:

```json
// kotlin.json
{
  "Main Function": {
    "prefix": "main",
    "body": [
      "fun main(args: Array<String>) {",
      "    $0",
      "}"
    ]
  }
}
```

Load in config:

```lua
require("luasnip.loaders.from_vscode").lazy_load({
  paths = { "./snippets" }
})
```

## Troubleshooting

### Completion Not Showing

1. Check LSP is attached: `:LspInfo`
2. Trigger manually: `<C-Space>`
3. Check cmp status: `:CmpStatus`

### Snippets Not Expanding

1. Ensure cursor is on snippet item
2. Press `<Tab>` to expand (not `<CR>`)
3. Check LuaSnip: `:lua print(require("luasnip").expandable())`

### Slow Completion

Limit buffer source to current buffer:

```lua
{ name = "buffer", keyword_length = 3 },
```

## Related

- [Editing Guide](../tasks/editing.md) - Usage guide
- [LSP](lsp.md) - Language server setup
