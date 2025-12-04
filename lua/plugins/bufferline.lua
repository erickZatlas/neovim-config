return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        offsets = {
          { filetype = "neo-tree", text = "Explorer", text_align = "center" },
        },
      },
    },
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<leader>bi", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
      { "<leader>bx", "<cmd>BufferLineCloseOthers<cr>", desc = "Close others" },
    },
  },
}
