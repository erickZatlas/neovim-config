---
title: "Data Files"
description: "Working with JSON, XML, and other structured data formats"
category: "tasks"
related:
  - README.md
  - code-intelligence.md
---

# Data Files

Work with JSON, XML, and other structured data files including formatting, folding, and validation.

## Setting Up a Data File

### Create a New Buffer

| Method | Command |
|--------|---------|
| Keybinding | `<leader>ba` |
| Command | `:enew` |

### Set Filetype

Neovim needs to know the file type for syntax highlighting and formatting:

```vim
:set ft=xml
:set ft=json
:set ft=yaml
```

### Auto-Detection

**XML** - Add declaration at the top:
```xml
<?xml version="1.0"?>
```

**JSON** - Save with `.json` extension.

**YAML** - Save with `.yml` or `.yaml` extension.

## Folding

Fold commands let you collapse and expand sections of structured data.

### Fold Commands

| Key | Action |
|-----|--------|
| `zc` | Close fold at cursor |
| `zo` | Open fold at cursor |
| `za` | Toggle fold at cursor |
| `zM` | Close ALL folds |
| `zR` | Open ALL folds |
| `zx` | Reset/recalculate folds |
| `zj` | Move to next fold |
| `zk` | Move to previous fold |

### How Folding Works

This configuration uses **indent-based folding**. Folds are created based on indentation levels:

```xml
<root>           <!-- Fold level 0 -->
  <parent>       <!-- Fold level 1 - can close this -->
    <child>      <!-- Fold level 2 - can close this -->
      content
    </child>
  </parent>
</root>
```

**Important**: Content must be properly indented for folds to work. Format first (`<leader>cf`), then use fold commands.

### Configuration

Current folding settings in `lua/config/options.lua`:

```lua
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99  -- Start with all folds open
vim.opt.foldenable = true
```

## Working with JSON

### Formatter
Uses `prettier` (installed via Mason).

### Workflow

1. Open new buffer: `<leader>ba`
2. Set filetype: `:set ft=json`
3. Paste JSON content
4. Format: `<leader>cf`
5. Reset folds: `zx`
6. Collapse all: `zM`

### Example

Before formatting:
```json
{"users":[{"name":"Alice","age":30},{"name":"Bob","age":25}]}
```

After `<leader>cf`:
```json
{
  "users": [
    {
      "name": "Alice",
      "age": 30
    },
    {
      "name": "Bob",
      "age": 25
    }
  ]
}
```

Now you can use `zc` to collapse individual objects or `zM` to collapse everything.

## Working with XML

### Formatter
Uses `xmllint` (install with `sudo apt install libxml2-utils`).

### Workflow

1. Open new buffer: `<leader>ba`
2. Set filetype: `:set ft=xml`
3. Paste XML content
4. Format: `<leader>cf`
5. Reset folds: `zx`
6. Navigate and collapse as needed

### Example

Before formatting:
```xml
<root><item><name>Test</name><value>123</value></item></root>
```

After `<leader>cf`:
```xml
<?xml version="1.0"?>
<root>
  <item>
    <name>Test</name>
    <value>123</value>
  </item>
</root>
```

### XML Declaration

If your XML doesn't have a declaration, xmllint adds one. This also helps Neovim auto-detect the filetype.

## Complete XML Workflow Example

Given this minified XML:
```xml
<project><dependencies><dependency><groupId>org.example</groupId><artifactId>lib</artifactId><version>1.0</version></dependency><dependency><groupId>com.other</groupId><artifactId>util</artifactId><version>2.0</version></dependency></dependencies></project>
```

**Step-by-step:**

1. **New buffer**: `<leader>ba`
2. **Set filetype**: `:set ft=xml`
3. **Paste** the XML
4. **Format**: `<leader>cf` - XML is now indented
5. **Reset folds**: `zx` - folds are calculated
6. **Close all**: `zM` - shows only `<project>`
7. **Open one level**: `zo` on `<project>` - shows `<dependencies>`
8. **Navigate folds**: `zj` / `zk` to move between folds

## Working with YAML

### Formatter
No formatter configured by default (YAML is whitespace-sensitive).

### Tips
- YAML is already indentation-based, so folding works well
- Be careful with formatting - it may change semantics
- Use `zc` / `zo` to collapse/expand sections

## Troubleshooting

### "No fold found" Error

1. **Content not indented**: Format first with `<leader>cf`
2. **Folds not calculated**: Run `zx` to recalculate
3. **Cursor not on foldable line**: Move to an indented line

### Formatting Doesn't Work

1. Check filetype is set: `:set ft?`
2. Check formatter is installed: `:Mason`
3. For XML: Install xmllint (`sudo apt install libxml2-utils`)
4. For JSON: prettier should be installed via Mason

### Syntax Not Highlighted

1. Ensure Treesitter parsers are installed: `:TSInstall xml json yaml`
2. Check filetype: `:set ft?`

### Large Files Slow

For very large data files:
- Disable folding temporarily: `:set nofoldenable`
- Use `zM` to close all folds (reduces rendering)

## Related

- [Code Intelligence](code-intelligence.md) - Formatting with `<leader>cf`
- [Editing](editing.md) - General editing commands
- [Navigation](navigation.md) - Moving around files
- [Keybinding Reference](../reference/keybindings.md) - Complete keybinding list
