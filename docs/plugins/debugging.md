---
title: "Debugging"
description: "Debug Adapter Protocol (DAP) for Kotlin/Java debugging"
category: "plugins"
related:
  - README.md
  - lsp.md
  - ../languages/kotlin.md
---

# Debugging

File: `lua/plugins/dap.lua`

## Overview

This configuration uses:
- **nvim-dap** - Debug Adapter Protocol client
- **nvim-dap-ui** - Debugging UI
- **nvim-dap-virtual-text** - Inline variable values
- **mason-nvim-dap** - Auto-installs debug adapters

## Supported Languages

| Language | Adapter | Auto-installed |
|----------|---------|----------------|
| Kotlin | `java-debug-adapter` | Yes |
| Java | `java-debug-adapter` | Yes |

## Keybindings

### Breakpoints

| Key | Action |
|-----|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dl` | Log point (prints message) |

### Execution Control

| Key | Action |
|-----|--------|
| `<leader>dc` | Continue / Start debugging |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Restart session |
| `<leader>dq` | Terminate session |
| `<leader>dL` | Run last configuration |

### UI & Inspection

| Key | Action |
|-----|--------|
| `<leader>du` | Toggle debug UI |
| `<leader>de` | Evaluate expression (normal/visual) |
| `<leader>dR` | Toggle REPL |

## Debug UI Layout

When debugging starts, the UI opens automatically:

```
┌─────────────────┬────────────────────────────┐
│ Scopes          │                            │
│ - Local vars    │      Source Code           │
│ - Arguments     │      (with breakpoints)    │
├─────────────────┤                            │
│ Breakpoints     │                            │
├─────────────────┤                            │
│ Call Stack      │                            │
├─────────────────┤                            │
│ Watches         │                            │
└─────────────────┴────────────────────────────┘
┌──────────────────────────────────────────────┐
│ REPL                    │ Console            │
└──────────────────────────────────────────────┘
```

## Breakpoint Signs

| Sign | Meaning |
|------|---------|
| `●` (red) | Breakpoint |
| `●` (orange) | Conditional breakpoint |
| `◆` (blue) | Log point |
| `→` (green) | Current execution line |
| `●` (gray) | Rejected breakpoint |

## Quick Start: Kotlin/Java

### Method 1: Attach to Running JVM (Recommended)

1. **Start your app with debug agent:**

```bash
./gradlew run --debug-jvm
```

Or add to `build.gradle.kts`:

```kotlin
tasks.named<JavaExec>("run") {
    jvmArgs = listOf("-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005")
}
```

2. **Set breakpoints** in Neovim: `<leader>db`

3. **Start debugging:** `<leader>dc`

4. **Select:** "Attach to JVM (port 5005)"

### Method 2: Launch Directly

1. **Build your project:** `./gradlew build`

2. **Set breakpoints:** `<leader>db`

3. **Start debugging:** `<leader>dc`

4. **Select:** "Launch Kotlin Main"

5. **Enter main class:** e.g., `com.example.MainKt`

## Debug Configurations

Three configurations are available:

### 1. Launch Kotlin Main

Launches a Kotlin main function directly.
- Prompts for main class name
- Auto-detects project name from Gradle

### 2. Attach to JVM (port 5005)

Attaches to a JVM running with debug agent on default port.
- No prompts required
- Fastest for repeated debugging

### 3. Attach to JVM (custom port)

Attaches to a JVM on any port.
- Prompts for port number
- Use when 5005 is unavailable

## Using the REPL

1. Open REPL: `<leader>dR`
2. Type expressions to evaluate
3. Access variables by name
4. Execute code in current context

## Watching Variables

1. Open debug UI: `<leader>du`
2. Navigate to "Watches" section
3. Press `a` to add a watch expression
4. Enter variable name or expression

## Evaluating Expressions

### Quick Evaluate

1. Position cursor on variable
2. Press `<leader>de`
3. See value in floating window

### Visual Evaluate

1. Select expression in visual mode
2. Press `<leader>de`
3. See evaluated result

## Troubleshooting

### Breakpoints Not Hitting

- Ensure source matches compiled bytecode
- Rebuild: `./gradlew clean build`
- Check class path matches

### Cannot Attach

- Verify JVM is running with debug agent
- Check port is correct and not in use
- Ensure `suspend=y` if you need to catch startup

### Adapter Not Found

1. Check Mason: `:Mason`
2. Look for `java-debug-adapter`
3. Install if missing: press `i`

### Kotlin Class Names

Remember Kotlin file `Main.kt` becomes class `MainKt`:
- File: `src/main/kotlin/com/example/Main.kt`
- Class: `com.example.MainKt`

## Related

- [Kotlin](../languages/kotlin.md) - Kotlin-specific setup
- [Java](../languages/java.md) - Java-specific setup
- [LSP](lsp.md) - Language server integration
