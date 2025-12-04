---
title: "Editing"
description: "Comments, surround, auto-pairs, and completion"
category: "tasks"
related:
  - README.md
  - code-intelligence.md
---

# Editing

## Comments

Toggle comments with the `gc` operator:

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | Normal | Toggle line comment |
| `gbc` | Normal | Toggle block comment |
| `gc{motion}` | Normal | Comment with motion |
| `gc` | Visual | Comment selection |
| `gb` | Visual | Block comment selection |

### Examples

```
gcc          " Comment current line
gc3j         " Comment 3 lines down
gcip         " Comment inner paragraph
```

Visual mode: Select lines, then press `gc`.

Comments are language-aware (JSX, HTML with scripts, Vue/Svelte).

## Surround

Add, change, or delete surrounding characters:

### Add Surroundings

| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surrounding |
| `yss{char}` | Surround entire line |
| `S{char}` | Surround selection (visual) |

**Examples:**

```
ysiw"    " Surround word with quotes:  hello → "hello"
ysiw)    " Surround with parens:       hello → (hello)
ys$"     " Surround to end of line
```

### Change Surroundings

| Key | Action |
|-----|--------|
| `cs{old}{new}` | Change surrounding |

**Examples:**

```
cs"'     " Change quotes:    "hello" → 'hello'
cs)]     " Change brackets:  (hello) → [hello]
```

### Delete Surroundings

| Key | Action |
|-----|--------|
| `ds{char}` | Delete surrounding |

**Examples:**

```
ds"      " Delete quotes:  "hello" → hello
ds)      " Delete parens:  (hello) → hello
```

## Auto Pairs

Brackets and quotes close automatically:

| You type | Result |
|----------|--------|
| `(` | `()` with cursor inside |
| `{` | `{}` with cursor inside |
| `[` | `[]` with cursor inside |
| `"` | `""` with cursor inside |
| `'` | `''` with cursor inside |

**Smart features:**
- Typing `)` when on `)` moves cursor right
- `Alt+e` wraps next word in pairs

## Text Selection

Treesitter incremental selection:

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+Space` | Normal | Start selection |
| `Ctrl+Space` | Visual | Expand selection |
| `Backspace` | Visual | Shrink selection |

Expands to increasingly larger syntax nodes (word → expression → statement → block → function).

## Visual Mode Operations

| Key | Mode | Action |
|-----|------|--------|
| `<` | Visual | Indent left (stay in visual) |
| `>` | Visual | Indent right (stay in visual) |
| `J` | Visual | Move selection down |
| `K` | Visual | Move selection up |

## Completion

Autocompletion appears as you type:

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+Space` | Insert | Trigger completion manually |
| `Tab` | Insert | Next item / expand snippet |
| `Shift+Tab` | Insert | Previous item |
| `Enter` | Insert | Confirm selection |
| `Ctrl+e` | Insert | Abort completion |
| `Ctrl+b` | Insert | Scroll docs up |
| `Ctrl+f` | Insert | Scroll docs down |

### Completion Sources

1. LSP (highest priority)
2. Snippets
3. Buffer words
4. File paths

See [plugins/completion.md](../plugins/completion.md) for configuration.

## Related

- [Code Intelligence](code-intelligence.md) - LSP features, formatting
- [Searching](searching.md) - Find and replace
