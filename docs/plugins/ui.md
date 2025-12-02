---
title: "UI Enhancements"
description: "Theme, statusline, indent guides, TODO comments, and more"
category: "plugins"
related:
  - README.md
  - ../keybindings.md
---

# UI Enhancements

Files: `lua/plugins/colorscheme.lua`, `lua/plugins/lualine.lua`, `lua/plugins/ui.lua`, `lua/plugins/which-key.lua`, `lua/plugins/alpha.lua`

## Color Scheme

**Plugin:** `tokyonight.nvim`

### Current Style

```lua
style = "night"  -- Dark theme
```

### Available Styles

| Style | Description |
|-------|-------------|
| `night` | Dark, default |
| `storm` | Dark, slightly lighter |
| `day` | Light theme |
| `moon` | Dark, different palette |

### Changing the Theme

Edit `lua/plugins/colorscheme.lua`:

```lua
opts = {
  style = "storm",
},
```

---

## Status Line

**Plugin:** `lualine.nvim`

### Layout

```
┌─────────┬────────────────────┬─────────────────┬──────────┬──────────┐
│  MODE   │ branch +1 -2 ~3 ⚠1 │  path/to/file   │ utf-8 lf │ 42% 10:5 │
└─────────┴────────────────────┴─────────────────┴──────────┴──────────┘
```

### Sections

| Section | Content |
|---------|---------|
| A (left) | Editor mode |
| B (left) | Git branch, diff stats, diagnostics |
| C (center) | Relative file path |
| X (right) | Encoding, file format, filetype |
| Y (right) | Progress percentage |
| Z (right) | Line:Column |

### Mode Indicators

| Mode | Display |
|------|---------|
| Normal | NORMAL |
| Insert | INSERT |
| Visual | VISUAL |
| Command | COMMAND |

---

## Indent Guides

**Plugin:** `indent-blankline.nvim`

### Appearance

```
function example()
│   if condition then
│   │   nested code
│   │   │   deeply nested
│   │   end
│   end
end
```

- Vertical lines show indentation levels
- Current scope is highlighted
- Disabled in special buffers (file explorer, dashboard, etc.)

---

## TODO Comments

**Plugin:** `todo-comments.nvim`

### Supported Keywords

| Keyword | Icon | Color |
|---------|------|-------|
| `TODO` | info | blue |
| `FIX` / `FIXME` / `BUG` | error | red |
| `HACK` | warning | orange |
| `WARN` / `WARNING` / `XXX` | warning | orange |
| `PERF` / `OPTIM` | performance | purple |
| `NOTE` / `INFO` | info | cyan |

### Syntax

```lua
-- TODO: implement this feature
-- FIXME: this is broken
-- HACK: temporary workaround
-- NOTE: important information
```

### Keybindings

| Key | Action |
|-----|--------|
| `]t` | Jump to next TODO |
| `[t` | Jump to previous TODO |
| `<leader>xt` | List all TODOs (Telescope) |

---

## Trouble (Diagnostics Panel)

**Plugin:** `trouble.nvim`

### Keybindings

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle all diagnostics |
| `<leader>xX` | Toggle buffer diagnostics |
| `<leader>xs` | Toggle symbols outline |
| `<leader>xq` | Toggle quickfix list |

### Diagnostics View

```
┌─ Diagnostics ──────────────────────────────────┐
│ ✖ error   file.kt:10   Unresolved reference    │
│ ⚠ warning file.kt:15   Unused variable         │
│ ℹ info    file.kt:20   Could be simplified     │
└────────────────────────────────────────────────┘
```

Press `<CR>` to jump to the diagnostic location.

---

## Which-Key (Keybinding Hints)

**Plugin:** `which-key.nvim`

### Behavior

1. Press a key (e.g., `<leader>`)
2. Wait 300ms
3. Popup shows available continuations

### Example

Press `<leader>`:

```
┌─────────────────────────────────────┐
│ +Debug    d   │ +Find      f       │
│ +Git      g   │ +Git Hunk  h       │
│ +Toggle   t   │ +Diagnost  x       │
│ +Code     c   │                    │
└─────────────────────────────────────┘
```

### Registered Groups

| Prefix | Group |
|--------|-------|
| `<leader>f` | Find (Telescope) |
| `<leader>d` | Debug |
| `<leader>g` | Git |
| `<leader>h` | Git Hunk |
| `<leader>c` | Code |
| `<leader>x` | Diagnostics |
| `<leader>t` | Toggle |

---

## Dashboard

**Plugin:** `alpha-nvim`

### Displayed on Startup

```

      ████ ██████           █████      ██
     ███████████             █████
     █████████ ███████████████████ ███   ███████████
    █████████  ███    █████████████ █████ ██████████████
   █████████ ██████████ █████████ █████ █████ ████ █████
 ███████████ ███    ███ █████████ █████ █████ ████ █████
██████  █████████████████████ ████ █████ █████ ████ ██████

        f  Find File        r  Recent Files
        g  Find Word        n  New File
        c  Config           l  Lazy
        m  Mason            q  Quit
```

### Button Shortcuts

| Key | Action |
|-----|--------|
| `f` | Find file (Telescope) |
| `r` | Recent files |
| `g` | Find word (Live grep) |
| `n` | New file |
| `c` | Edit config (init.lua) |
| `l` | Open Lazy (plugins) |
| `m` | Open Mason |
| `q` | Quit |

---

## Customization

### Change Status Line Theme

```lua
-- lua/plugins/lualine.lua
opts = {
  options = {
    theme = "tokyonight",  -- or "auto", "gruvbox", etc.
  },
},
```

### Disable Indent Guides for Filetype

```lua
-- lua/plugins/ui.lua
exclude = {
  filetypes = {
    "help",
    "alpha",
    "myfiletype",  -- Add your filetype
  },
},
```

### Add Custom TODO Keyword

```lua
-- lua/plugins/ui.lua
keywords = {
  REVIEW = { icon = "👀", color = "hint" },
},
```

## Related

- [Keybindings](../keybindings.md) - Full keybinding reference
- [Getting Started](../getting-started.md) - Installation and setup
