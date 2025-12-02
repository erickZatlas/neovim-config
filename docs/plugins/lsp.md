---
title: "LSP Configuration"
description: "Language Server Protocol setup with Mason"
category: "plugins"
related:
  - README.md
  - completion.md
  - ../languages/README.md
---

# LSP Configuration

File: `lua/plugins/lsp.lua`

## Overview

This configuration uses:
- **mason.nvim** - Package manager for LSP servers, formatters, linters
- **mason-lspconfig.nvim** - Bridge between Mason and nvim-lspconfig
- **nvim-lspconfig** - LSP client configurations

## Installed Language Servers

| Server | Language | Auto-installed |
|--------|----------|----------------|
| `kotlin_language_server` | Kotlin | Yes |
| `jdtls` | Java | Yes |
| `pyright` | Python | Yes |
| `ts_ls` | TypeScript/JavaScript | Yes |

## Mason UI

Open Mason to manage installations:

```vim
:Mason
```

- `i` - Install package
- `u` - Update package
- `X` - Uninstall package

## Keybindings

### Navigation

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `<leader>D` | Go to type definition |

### Information

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `<C-k>` | Signature help |

### Actions

| Key | Action |
|-----|--------|
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>oi` | Organize imports |

### Diagnostics

| Key | Action |
|-----|--------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>d` | Show diagnostic float |
| `<leader>q` | Set location list |

## Diagnostic Display

Diagnostics appear as:
- **Virtual text** with `●` prefix
- **Signs** in the gutter
- **Underlines** under problematic code
- **Float window** on `<leader>d`

## Adding a New Language Server

### Step 1: Add to Mason

In `lua/plugins/lsp.lua`, add to `ensure_installed`:

```lua
ensure_installed = {
  "kotlin_language_server",
  "jdtls",
  "pyright",
  "ts_ls",
  "rust_analyzer",  -- Add new server
},
```

### Step 2: Configure the Server

Add a handler in the `handlers` table:

```lua
["rust_analyzer"] = function()
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  })
end,
```

### Step 3: Add Formatter/Linter (Optional)

See [Languages](../languages/README.md) for formatter configuration.

## Troubleshooting

### LSP Not Starting

1. Check if server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. View logs: `:LspLog`

### Server Not Found

Ensure the server name matches Mason's naming:
- Mason uses `typescript-language-server`
- nvim-lspconfig uses `ts_ls`

### Slow LSP

Some servers support workspace configuration to limit scope:

```lua
settings = {
  python = {
    analysis = {
      autoSearchPaths = false,
    },
  },
},
```

## Server-Specific Configuration

### Kotlin

```lua
settings = {
  kotlin = {
    compiler = {
      jvm = { target = "17" },
    },
  },
},
```

### Python (Pyright)

```lua
settings = {
  python = {
    analysis = {
      typeCheckingMode = "basic",
      autoSearchPaths = true,
      useLibraryCodeForTypes = true,
    },
  },
},
```

See individual [language documentation](../languages/README.md) for more.

## Related

- [Completion](completion.md) - LSP-powered completion
- [Languages](../languages/README.md) - Language-specific setup
- [Debugging](debugging.md) - Debug adapter setup
