---
title: "TypeScript / JavaScript"
description: "TypeScript and JavaScript language support configuration"
category: "languages"
related:
  - README.md
  - ../plugins/lsp.md
---

# TypeScript / JavaScript

## Overview

| Component | Tool |
|-----------|------|
| Language Server | `ts_ls` (typescript-language-server) |
| Formatter | `prettier` |
| Linter | `eslint_d` |
| Debugger | - (not configured) |

## Supported File Types

- `.ts` - TypeScript
- `.tsx` - TypeScript React
- `.js` - JavaScript
- `.jsx` - JavaScript React
- `.mjs` - ES Modules
- `.cjs` - CommonJS

## Features

- Syntax highlighting
- Code completion
- Type checking
- Auto-imports
- Go to definition
- Find references
- Rename symbol
- Code actions
- Format on save
- ESLint integration

## Project Detection

The TypeScript LSP activates when it detects:

- `package.json`
- `tsconfig.json`
- `jsconfig.json`

## Configuration

### TypeScript Language Server

Default configuration in `lua/plugins/lsp.lua`:

```lua
["ts_ls"] = function()
  lspconfig.ts_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern(
      "package.json",
      "tsconfig.json",
      "jsconfig.json"
    ),
  })
end,
```

### tsconfig.json

Example TypeScript configuration:

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "node",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true,
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules"]
}
```

## Formatting

### Prettier

Runs automatically on save for:
- TypeScript/JavaScript
- JSON
- CSS
- HTML

Format manually:
```
<leader>f
```

### Configuration

Create `.prettierrc` in project root:

```json
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5",
  "printWidth": 80
}
```

Or in `package.json`:

```json
{
  "prettier": {
    "semi": true,
    "singleQuote": true
  }
}
```

## Linting

### ESLint (via eslint_d)

`eslint_d` is a faster ESLint daemon. Runs on:
- File open
- File save
- Leaving insert mode

Trigger manually: `<leader>l`

### Configuration

Create `.eslintrc.js`:

```javascript
module.exports = {
  env: {
    browser: true,
    es2022: true,
    node: true,
  },
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
  },
  rules: {
    // your rules
  },
};
```

Or for flat config (ESLint 9+), create `eslint.config.js`.

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
| `<leader>f` | Format (Prettier) |
| `<leader>l` | Lint (ESLint) |

## Code Actions

Press `<leader>ca` for available actions:

- Add missing imports
- Remove unused imports
- Organize imports
- Fix ESLint issues
- Convert to arrow function
- Extract to function/variable
- Generate getters/setters

## JSX/TSX Support

Full support for React:
- JSX syntax highlighting
- Component completion
- Props type checking
- Auto-close tags (via autopairs)

### Context-Aware Comments

Comments adapt to context in JSX:

```tsx
// JavaScript comment
function Component() {
  return (
    <div>
      {/* JSX comment */}
      <span>Hello</span>
    </div>
  );
}
```

## Project Setup

### package.json Example

```json
{
  "name": "my-project",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "lint": "eslint src",
    "format": "prettier --write src"
  },
  "devDependencies": {
    "@typescript-eslint/eslint-plugin": "^6.0.0",
    "@typescript-eslint/parser": "^6.0.0",
    "eslint": "^8.0.0",
    "prettier": "^3.0.0",
    "typescript": "^5.0.0"
  }
}
```

### Installing Dependencies

```bash
npm install
# or
yarn install
# or
pnpm install
```

## Framework Support

### React

Works out of the box with `.tsx` files.

### Vue

Add Vue language server:

1. Install in Mason: `vue-language-server`
2. Configure in `lua/plugins/lsp.lua`

### Svelte

Add Svelte language server:

1. Install in Mason: `svelte-language-server`
2. Configure in `lua/plugins/lsp.lua`

## Troubleshooting

### LSP Not Starting

1. Ensure `package.json` or `tsconfig.json` exists
2. Check: `:LspInfo`
3. Restart: `:LspRestart`

### Type Errors Not Showing

1. Ensure `tsconfig.json` is valid
2. Check strict mode settings
3. Restart LSP

### ESLint Not Working

1. Ensure ESLint is installed: `npm install eslint`
2. Ensure config file exists
3. Check eslint_d in Mason: `:Mason`

### Prettier vs ESLint Conflicts

Use `eslint-config-prettier` to disable ESLint rules that conflict:

```bash
npm install --save-dev eslint-config-prettier
```

Add to ESLint config:

```javascript
extends: [
  'eslint:recommended',
  'prettier',  // Must be last
],
```

### Slow Performance

For large projects:
1. Exclude `node_modules` in tsconfig
2. Use project references for monorepos
3. Consider using `typescript.preferences.includePackageJsonAutoImports`

## Related

- [LSP Configuration](../plugins/lsp.md) - Detailed LSP setup
- [Languages Overview](README.md) - All supported languages
