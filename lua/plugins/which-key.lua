return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      win = {
        border = "rounded",
        padding = { 2, 2, 2, 2 },
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "center",
      },
      spec = {
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>h", group = "Git Hunk" },
        { "<leader>c", group = "Code" },
        { "<leader>x", group = "Diagnostics" },
        { "<leader>t", group = "Toggle" },
        { "<leader>d", group = "Debug" },
      },
    },
  },
}
