return {
  {
    "OXY2DEV/markview.nvim",
    -- Markview lazy-loads itself per buffer; lazy.nvim lazy-loading is
    -- discouraged by the plugin author.
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      preview = {
        icon_provider = "devicons",
        -- Render in normal/operator/command modes; insert mode shows raw markdown
        modes = { "n", "no", "c" },
        -- In normal mode, show the node under the cursor as raw markdown
        hybrid_modes = { "n" },
      },
    },
    keys = {
      { "<leader>tm", "<cmd>Markview toggle<cr>", desc = "Markview (buffer)" },
      { "<leader>tM", "<cmd>Markview Toggle<cr>", desc = "Markview (global)" },
      { "<leader>ts", "<cmd>Markview splitToggle<cr>", desc = "Markview split preview" },
    },
  },
}
