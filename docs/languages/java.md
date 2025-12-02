---
title: "Java"
description: "Java language support configuration"
category: "languages"
related:
  - README.md
  - kotlin.md
  - ../plugins/debugging.md
---

# Java

## Overview

| Component | Tool |
|-----------|------|
| Language Server | `jdtls` (Eclipse JDT) |
| Formatter | `google-java-format` |
| Linter | (via jdtls) |
| Debugger | `java-debug-adapter` |

## Features

- Syntax highlighting
- Code completion
- Go to definition
- Find references
- Rename symbol
- Code actions
- Organize imports
- Format on save
- Debugging

## Project Detection

The Java LSP activates when it detects:

- `settings.gradle`
- `settings.gradle.kts`
- `build.gradle`
- `build.gradle.kts`
- `pom.xml`
- `.git`

## Configuration

### JDTLS

JDTLS is the Eclipse Java Development Tools Language Server. It provides comprehensive Java support.

Configuration in `lua/plugins/lsp.lua`:

```lua
["jdtls"] = function()
  lspconfig.jdtls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern(
      "settings.gradle",
      "settings.gradle.kts",
      "build.gradle",
      "build.gradle.kts",
      "pom.xml",
      ".git"
    ),
  })
end,
```

## Formatting

### google-java-format

Runs automatically on save. Format manually:

```
<leader>f
```

### Style

Google Java Format enforces the [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html):
- 2-space indentation
- 100-character line limit
- Specific import ordering

### Alternative Formatters

To use a different formatter, update `lua/plugins/formatting.lua`:

```lua
java = { "prettier" },  -- or other formatter
```

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

#### Method 2: Attach to Maven

```bash
mvn exec:java -Dexec.mainClass="com.example.Main" \
  -Dexec.args="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"
```

#### Method 3: Launch Directly

1. Build your project
2. Set breakpoints: `<leader>db`
3. Start debugging: `<leader>dc`
4. Select "Launch Kotlin Main" (works for Java too)
5. Enter class name (e.g., `com.example.Main`)

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

## Build Tool Integration

### Gradle

```bash
# Build
./gradlew build

# Run
./gradlew run

# Test
./gradlew test

# Debug
./gradlew run --debug-jvm
```

### Maven

```bash
# Build
mvn compile

# Run
mvn exec:java -Dexec.mainClass="com.example.Main"

# Test
mvn test

# Package
mvn package
```

## Code Actions

Press `<leader>ca` for available actions:

- Generate getters/setters
- Generate constructor
- Generate equals/hashCode
- Implement interface methods
- Override methods
- Extract method/variable
- Organize imports

## Troubleshooting

### LSP Not Starting

1. Ensure project has build files (Gradle/Maven)
2. Check: `:LspInfo`
3. Restart: `:LspRestart`
4. Check logs: `:LspLog`

### Slow Indexing

JDTLS can be slow on first load for large projects. It builds an index that speeds up subsequent loads.

### Import Errors

1. Run organize imports: `<leader>oi`
2. Check dependencies in build file
3. Rebuild project

### Formatting Different from Team

Ensure team uses the same formatter:
- Share formatter config
- Use EditorConfig
- Consider project-specific settings

## Advanced Configuration

### Custom JDTLS Settings

For more control, consider using `nvim-jdtls` plugin instead of basic lspconfig setup. It provides:
- Better workspace management
- Hot code replace
- Test runner integration
- Enhanced debugging

## Related

- [Kotlin](kotlin.md) - Similar JVM setup
- [Debugging](../plugins/debugging.md) - Full debug documentation
- [LSP](../plugins/lsp.md) - LSP configuration details
