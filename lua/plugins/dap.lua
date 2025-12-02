return {
  -- Mason DAP integration (auto-install debug adapters)
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = { "java-debug-adapter", "java-test" },
      automatic_installation = true,
      handlers = {},
    },
  },

  -- Core DAP client
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional breakpoint" },
      { "<leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log: ")) end, desc = "Log point" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step out" },
      { "<leader>dr", function() require("dap").restart() end, desc = "Restart" },
      { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dR", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>dL", function() require("dap").run_last() end, desc = "Run last" },
    },
    config = function()
      local dap = require("dap")

      -- Breakpoint signs
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "●", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })

      -- Highlight groups for breakpoint signs
      vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51400" })
      vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#f5a623" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })
      vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379", bg = "#31353f" })
      vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#656565" })

      -- Java/Kotlin debug adapter configuration
      dap.adapters.java = function(callback)
        callback({
          type = "server",
          host = "127.0.0.1",
          port = "${port}",
          executable = {
            command = "java-debug-adapter",
            args = { "${port}" },
          },
        })
      end

      -- Kotlin debug configurations
      dap.configurations.kotlin = {
        {
          type = "java",
          request = "launch",
          name = "Launch Kotlin Main",
          mainClass = function()
            return vim.fn.input("Main class (e.g., com.example.MainKt): ")
          end,
          projectName = function()
            local root = vim.fn.getcwd()
            local settings_file = root .. "/settings.gradle.kts"
            if vim.fn.filereadable(settings_file) == 0 then
              settings_file = root .. "/settings.gradle"
            end
            if vim.fn.filereadable(settings_file) == 1 then
              local content = vim.fn.readfile(settings_file)
              for _, line in ipairs(content) do
                local name = line:match('rootProject.name%s*=%s*"([^"]+)"')
                if name then return name end
              end
            end
            return vim.fn.input("Project name: ")
          end,
        },
        {
          type = "java",
          request = "attach",
          name = "Attach to JVM (port 5005)",
          hostName = "127.0.0.1",
          port = 5005,
        },
        {
          type = "java",
          request = "attach",
          name = "Attach to JVM (custom port)",
          hostName = "127.0.0.1",
          port = function()
            return tonumber(vim.fn.input("Debug port: ", "5005"))
          end,
        },
      }

      -- Share configurations with Java
      dap.configurations.java = dap.configurations.kotlin
    end,
  },

  -- Debug UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle debug UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Evaluate expression", mode = { "n", "v" } },
    },
    config = function()
      local dapui = require("dapui")
      local dap = require("dap")

      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "→" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.4 },
              { id = "breakpoints", size = 0.2 },
              { id = "stacks", size = 0.2 },
              { id = "watches", size = 0.2 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",
          },
        },
        floating = {
          border = "rounded",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
      })

      -- Auto-open UI when debugging starts
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Virtual text for variable values
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      virt_text_pos = "eol",
    },
  },
}
