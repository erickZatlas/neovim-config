---
title: "Debugging"
description: "Breakpoints, stepping, and evaluation with DAP"
category: "tasks"
related:
  - README.md
  - code-intelligence.md
---

# Debugging

Debug Adapter Protocol (DAP) for Kotlin and Java.

## Supported Languages

| Language | Adapter |
|----------|---------|
| Kotlin | java-debug-adapter |
| Java | java-debug-adapter |

## Breakpoints

| Key | Action |
|-----|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dl` | Log point (prints message) |

### Breakpoint Signs

| Sign | Meaning |
|------|---------|
| `●` (red) | Breakpoint |
| `●` (orange) | Conditional breakpoint |
| `◆` (blue) | Log point |
| `→` (green) | Current execution line |

## Execution Control

| Key | Action |
|-----|--------|
| `<leader>dc` | Continue / Start debugging |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Restart session |
| `<leader>dq` | Terminate session |
| `<leader>dL` | Run last configuration |

## Inspection

| Key | Action |
|-----|--------|
| `<leader>du` | Toggle debug UI |
| `<leader>de` | Evaluate expression |
| `<leader>dR` | Toggle REPL |

### Evaluate Expression

- Normal mode: Evaluates word under cursor
- Visual mode: Evaluates selection

### Debug UI Layout

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

## Quick Start: Kotlin/Java

### Method 1: Attach to Running JVM (Recommended)

1. Start your app with debug agent:

```bash
./gradlew run --debug-jvm
```

2. Set breakpoints in Neovim: `<leader>db`

3. Start debugging: `<leader>dc`

4. Select "Attach to JVM (port 5005)"

### Method 2: Launch Directly

1. Build your project: `./gradlew build`

2. Set breakpoints: `<leader>db`

3. Start debugging: `<leader>dc`

4. Select "Launch Kotlin Main"

5. Enter main class (e.g., `com.example.MainKt`)

## Debug Configurations

Three options when starting (`<leader>dc`):

1. **Launch Kotlin Main** - Run main function directly
2. **Attach to JVM (port 5005)** - Connect to running JVM
3. **Attach to JVM (custom port)** - Specify different port

## Watching Variables

1. Open debug UI: `<leader>du`
2. Navigate to "Watches" section
3. Press `a` to add expression
4. Type variable name

## REPL

1. Open REPL: `<leader>dR`
2. Type expressions to evaluate
3. Access current scope variables
4. Execute code in debug context

## Kotlin Class Names

Kotlin file `Main.kt` becomes class `MainKt`:

- File: `src/main/kotlin/com/example/Main.kt`
- Class: `com.example.MainKt`

## Troubleshooting

### Breakpoints Not Hitting

- Rebuild: `./gradlew clean build`
- Ensure source matches bytecode
- Check class path

### Cannot Attach

- Verify JVM has debug agent running
- Check port (default 5005)
- Use `suspend=y` to pause on startup

### Adapter Not Found

1. Open Mason: `:Mason`
2. Find `java-debug-adapter`
3. Press `i` to install

## Related

- [Code Intelligence](code-intelligence.md) - LSP features
- [plugins/dap.md](../plugins/dap.md) - Configuration details
- [languages/kotlin.md](../languages/kotlin.md) - Kotlin setup
- [languages/java.md](../languages/java.md) - Java setup
