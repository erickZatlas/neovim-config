---
title: "Python"
description: "Python language support configuration"
category: "languages"
related:
  - README.md
  - ../plugins/lsp.md
---

# Python

## Overview

| Component | Tool |
|-----------|------|
| Language Server | `pyright` |
| Formatter | `black` |
| Linter | `ruff` |
| Debugger | - (not configured) |

## Features

- Syntax highlighting
- Code completion
- Type checking
- Go to definition
- Find references
- Rename symbol
- Code actions
- Format on save
- Fast linting with ruff

## Configuration

### Pyright

Type checking and language features.

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

### Type Checking Modes

| Mode | Description |
|------|-------------|
| `off` | No type checking |
| `basic` | Basic type checking (default) |
| `standard` | Standard type checking |
| `strict` | Strict type checking |

To change, edit `lua/plugins/lsp.lua`.

## Formatting

### Black

The uncompromising Python formatter. Runs on save.

Format manually:
```
<leader>cf
```

### Configuration

Create `pyproject.toml` in project root:

```toml
[tool.black]
line-length = 88
target-version = ['py311']
include = '\.pyi?$'
```

## Linting

### Ruff

An extremely fast Python linter. Runs on:
- File open
- File save
- Leaving insert mode

Trigger manually: `<leader>cl`

### Configuration

Create `pyproject.toml`:

```toml
[tool.ruff]
line-length = 88
select = [
    "E",   # pycodestyle errors
    "W",   # pycodestyle warnings
    "F",   # Pyflakes
    "I",   # isort
    "B",   # flake8-bugbear
    "C4",  # flake8-comprehensions
]
ignore = ["E501"]  # line too long
```

Or `ruff.toml`:

```toml
line-length = 88
select = ["E", "W", "F", "I"]
```

## Virtual Environments

### Automatic Detection

Pyright automatically detects:
- `.venv/` in project root
- `venv/` in project root
- Active conda environment

### Manual Configuration

Create `pyrightconfig.json`:

```json
{
  "venvPath": ".",
  "venv": ".venv"
}
```

Or in `pyproject.toml`:

```toml
[tool.pyright]
venvPath = "."
venv = ".venv"
```

## Useful Keybindings

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `<leader>cr` | Rename |
| `<leader>ca` | Code actions |
| `<leader>cf` | Format (Black) |
| `<leader>cl` | Lint (Ruff) |

## Project Setup

### Recommended Structure

```
myproject/
├── pyproject.toml
├── .venv/
├── src/
│   └── mypackage/
│       ├── __init__.py
│       └── main.py
├── tests/
│   └── test_main.py
└── requirements.txt
```

### pyproject.toml Example

```toml
[project]
name = "myproject"
version = "0.1.0"
requires-python = ">=3.11"

[tool.black]
line-length = 88

[tool.ruff]
line-length = 88
select = ["E", "W", "F", "I", "B"]

[tool.pyright]
typeCheckingMode = "basic"
venvPath = "."
venv = ".venv"
```

### Creating Virtual Environment

```bash
# Create venv
python -m venv .venv

# Activate (Linux/macOS)
source .venv/bin/activate

# Activate (Windows)
.venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

## Type Hints

Pyright provides better completions with type hints:

```python
def greet(name: str) -> str:
    return f"Hello, {name}"

def process_items(items: list[int]) -> dict[str, int]:
    return {"sum": sum(items), "count": len(items)}
```

## Troubleshooting

### LSP Not Finding Packages

1. Ensure venv is activated when starting Neovim
2. Check venv detection: `:LspInfo`
3. Configure venv path in `pyrightconfig.json`

### Type Errors Too Strict

Change type checking mode:

```lua
typeCheckingMode = "off",  -- or "basic"
```

### Ruff and Black Conflicts

Both tools are compatible. Ruff can replace Black for formatting if desired:

```lua
-- In formatting.lua
python = { "ruff_format" },  -- instead of "black"
```

### Import Sorting

Ruff includes isort functionality. Enable with:

```toml
[tool.ruff]
select = ["I"]  # isort rules
```

## Adding Debug Support

To add Python debugging, install `debugpy`:

```bash
pip install debugpy
```

Then configure nvim-dap for Python (not included in default config).

## Related

- [LSP Configuration](../plugins/lsp.md) - Detailed LSP setup
- [Languages Overview](README.md) - All supported languages
