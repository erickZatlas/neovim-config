---
title: "Code Intelligence"
description: "LSP, formatting, linting, and diagnostics"
category: "tasks"
related:
  - README.md
  - navigation.md
---

# Code Intelligence

Features powered by Language Server Protocol (LSP).

## Hover and Documentation

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `Ctrl+k` | Signature help (in function call) |

Place cursor on any symbol and press `K` to see its documentation.

## Code Actions

| Key | Action |
|-----|--------|
| `<leader>ca` | Show available code actions |
| `<leader>cr` | Rename symbol |
| `<leader>cd` | Go to type definition |
| `<leader>co` | Organize imports |

### Rename Example

1. Place cursor on symbol
2. Press `<leader>cr`
3. Type new name
4. Press Enter

All references update automatically.

## Formatting

| Key | Action |
|-----|--------|
| `<leader>cf` | Format buffer |

**Format on save** is enabled by default. Formatters per language:

| Language | Formatter |
|----------|-----------|
| Kotlin | ktlint |
| Java | google-java-format |
| Python | black |
| TypeScript/JavaScript | prettier |

See [plugins/lsp.md](../plugins/lsp.md) for configuration.

## Linting

| Key | Action |
|-----|--------|
| `<leader>cl` | Lint buffer manually |

**Auto-lint** runs on save and when leaving insert mode. Linters:

| Language | Linter |
|----------|--------|
| Kotlin | ktlint |
| Python | ruff |
| TypeScript/JavaScript | eslint_d |

## Diagnostics

### Navigation

| Key | Action |
|-----|--------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>xf` | Show diagnostic in float |

### Diagnostics Panel (Trouble)

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle all diagnostics |
| `<leader>xX` | Toggle buffer diagnostics |
| `<leader>xs` | Toggle symbols outline |
| `<leader>xl` | Set location list |
| `<leader>xq` | Toggle quickfix |

### Diagnostic Display

Diagnostics appear as:
- **Virtual text** with `●` prefix at end of line
- **Signs** in the gutter (E for error, W for warning)
- **Underlines** under problematic code
- **Float window** on `<leader>xf`

## TODO Comments

Navigate TODO, FIXME, HACK comments:

| Key | Action |
|-----|--------|
| `]t` | Next TODO comment |
| `[t` | Previous TODO comment |
| `<leader>xt` | List all TODOs (Telescope) |

Recognized keywords: `TODO`, `FIXME`, `HACK`, `WARN`, `PERF`, `NOTE`, `TEST`

## LSP Status

Check if LSP is attached:

```vim
:LspInfo
```

View LSP logs for troubleshooting:

```vim
:LspLog
```

## Troubleshooting

### LSP Not Starting

1. Check if server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. View logs: `:LspLog`

### Formatting Not Working

1. Ensure formatter is installed: `:Mason`
2. Check conform.nvim status: `:ConformInfo`
3. Verify file type: `:set ft?`

### No Code Actions Available

- Not all code positions have actions
- Try on import statements, warnings, or errors
- Some actions require cursor on specific elements

## Related

- [Navigation](navigation.md) - Go to definition, references
- [Editing](editing.md) - Completion
- [plugins/lsp.md](../plugins/lsp.md) - LSP configuration details
