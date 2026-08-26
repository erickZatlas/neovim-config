return {
  -- Mason: Package manager for LSP servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },

  -- Mason-tool-installer: Auto-install formatters and linters
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Kotlin
        "ktlint",
        "detekt",
        -- Python
        "black",
        "ruff",
        -- JavaScript/TypeScript
        "prettier",
        "eslint_d",
        -- Java
        "google-java-format",
      },
      auto_update = false,
      run_on_start = true,
    },
  },

  -- nvim-lspconfig: LSP configurations
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Configure jdtls to use Java 21 (required by jdtls, but project can use Java 17)
      local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
      local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
      vim.lsp.config("jdtls", {
        cmd = {
          "/usr/lib/jvm/java-21-openjdk-amd64/bin/java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens", "java.base/java.util=ALL-UNNAMED",
          "--add-opens", "java.base/java.lang=ALL-UNNAMED",
          "-jar", launcher_jar,
          "-configuration", jdtls_path .. "/config_linux",
          "-data", vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
        },
      })

      -- Enhanced capabilities for nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend(
        "force",
        capabilities,
        cmp_nvim_lsp.default_capabilities()
      )

      -- On attach function (for non-keymap setup if needed)
      local on_attach = function(client, bufnr)
        -- Keymaps are set via LspAttach autocmd below
      end

      -- Setup mason-lspconfig with handlers (compatible with Neovim 0.10)
      require("mason-lspconfig").setup({
        ensure_installed = {
          "kotlin_language_server",
          "jdtls",           -- Java
          "pyright",         -- Python
          "ts_ls",           -- TypeScript/JavaScript
        },
        handlers = {
          -- Default handler for all servers
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end,
          -- Kotlin
          ["kotlin_language_server"] = function()
            lspconfig.kotlin_language_server.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              cmd = { "kotlin-language-server" },
              filetypes = { "kotlin" },
              root_dir = lspconfig.util.root_pattern(
                "settings.gradle",
                "settings.gradle.kts",
                "build.gradle",
                "build.gradle.kts",
                "pom.xml"
              ),
              settings = {
                kotlin = {
                  compiler = {
                    jvm = {
                      target = "17",
                    },
                  },
                },
              },
            })
          end,
          -- Java (jdtls requires Java 21+ to run, but can work with Java 17 projects)
          ["jdtls"] = function()
            local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
            local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
            local config_dir = jdtls_path .. "/config_linux"
            local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

            lspconfig.jdtls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              cmd = {
                "/usr/lib/jvm/java-21-openjdk-amd64/bin/java",
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.protocol=true",
                "-Dlog.level=ALL",
                "-Xmx1g",
                "--add-modules=ALL-SYSTEM",
                "--add-opens", "java.base/java.util=ALL-UNNAMED",
                "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                "-jar", launcher_jar,
                "-configuration", config_dir,
                "-data", workspace_dir,
              },
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
          -- Python
          ["pyright"] = function()
            lspconfig.pyright.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                python = {
                  analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                  },
                },
              },
            })
          end,
          -- TypeScript/JavaScript
          ["ts_ls"] = function()
            lspconfig.ts_ls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              root_dir = lspconfig.util.root_pattern(
                "package.json",
                "tsconfig.json",
                "jsconfig.json",
                ".git"
              ),
            })
          end,
        },
      })

      -- LSP keymaps via LspAttach (guaranteed to run after client attaches)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local function map(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
          end

          -- Navigation
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gr", vim.lsp.buf.references, "Go to references")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<C-k>", vim.lsp.buf.signature_help, "Signature help")

          -- Code actions
          map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>cd", vim.lsp.buf.type_definition, "Type definition")
          map("<leader>co", function()
            vim.lsp.buf.code_action({
              context = { only = { "source.organizeImports" } },
              apply = true,
            })
          end, "Organize imports")

          -- Diagnostics
          map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("]d", vim.diagnostic.goto_next, "Next diagnostic")
          map("<leader>xf", vim.diagnostic.open_float, "Show diagnostic")
          map("<leader>xl", vim.diagnostic.setloclist, "Location list")
        end,
      })

      -- Configure diagnostics display
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })
    end,
  },
}
