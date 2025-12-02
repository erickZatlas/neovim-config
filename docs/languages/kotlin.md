---
title: "Kotlin"
description: "Kotlin language support configuration"
category: "languages"
related:
  - README.md
  - java.md
  - ../plugins/debugging.md
---

# Kotlin

## Overview

| Component | Tool |
|-----------|------|
| Language Server | `kotlin_language_server` |
| Formatter | `ktlint` |
| Linter | `ktlint` |
| Debugger | `java-debug-adapter` |

## Features

- Syntax highlighting
- Code completion
- Go to definition
- Find references
- Rename symbol
- Code actions
- Format on save
- Linting
- Debugging

## Project Detection

The Kotlin LSP activates when it detects:

- `settings.gradle`
- `settings.gradle.kts`
- `build.gradle`
- `build.gradle.kts`
- `pom.xml`

## Configuration

### JVM Target

Configured for JVM 17:

```lua
settings = {
  kotlin = {
    compiler = {
      jvm = {
        target = "17",
      },
    },
  },
},
```

To change, edit `lua/plugins/lsp.lua`.

### Indentation

Kotlin uses 4-space indentation (configured in `lua/config/options.lua`):

```lua
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
```

## Formatting

### ktlint

Runs automatically on save. Format manually:

```
<leader>f
```

### Configuration

Create `.editorconfig` in project root:

```ini
[*.{kt,kts}]
indent_size = 4
insert_final_newline = true
max_line_length = 120
```

Or `ktlint.json` for ktlint-specific rules.

## Linting

ktlint runs on:
- File open
- File save
- Leaving insert mode

Trigger manually: `<leader>l`

## Debugging

### Setup

Debug adapter is auto-installed via Mason.

### Starting Debug Session

#### Method 1: Attach to Gradle

1. Run with debug agent:

```bash
./gradlew run --debug-jvm
```

2. Set breakpoints: `<leader>db`
3. Start debugging: `<leader>dc`
4. Select "Attach to JVM (port 5005)"

#### Method 2: Launch Directly

1. Build: `./gradlew build`
2. Set breakpoints: `<leader>db`
3. Start debugging: `<leader>dc`
4. Select "Launch Kotlin Main"
5. Enter class name (e.g., `com.example.MainKt`)

### Class Naming

Kotlin files become classes with `Kt` suffix:

| File | Class |
|------|-------|
| `Main.kt` | `MainKt` |
| `App.kt` | `AppKt` |
| `Application.kt` | `ApplicationKt` |

In package `com.example`:
- File: `src/main/kotlin/com/example/Main.kt`
- Class: `com.example.MainKt`

### Debug Keybindings

| Key | Action |
|-----|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue/Start |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>du` | Toggle debug UI |

See [Debugging](../plugins/debugging.md) for full details.

## Useful Keybindings

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename |
| `<leader>ca` | Code actions |
| `<leader>oi` | Organize imports |
| `<leader>f` | Format |

## Gradle Integration

### build.gradle.kts Example

```kotlin
plugins {
    kotlin("jvm") version "1.9.0"
    application
}

application {
    mainClass.set("com.example.MainKt")
}

// Enable debug agent for ./gradlew run --debug-jvm
tasks.named<JavaExec>("run") {
    standardInput = System.`in`
}
```

### Running

```bash
# Run application
./gradlew run

# Run with debugging
./gradlew run --debug-jvm

# Run tests
./gradlew test
```

## Troubleshooting

### LSP Not Starting

1. Ensure project has Gradle/Maven files
2. Check: `:LspInfo`
3. Restart LSP: `:LspRestart`

### Completion Not Working

1. Wait for LSP to index (can take time for large projects)
2. Check LSP attached: `:LspInfo`
3. Trigger manually: `<C-Space>`

### Formatting Issues

1. Ensure ktlint is installed: `:Mason`
2. Check for `.editorconfig` conflicts
3. Try manual format: `<leader>f`

### Debug Breakpoints Not Hitting

1. Ensure source matches compiled code
2. Rebuild: `./gradlew clean build`
3. Verify correct main class name

## Related

- [Java](java.md) - Similar JVM setup
- [Debugging](../plugins/debugging.md) - Full debug documentation
- [LSP](../plugins/lsp.md) - LSP configuration details
