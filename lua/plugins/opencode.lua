-- opencode.nvim — embeds the `opencode` agent TUI inside Neovim and
-- adds context-passing keymaps (current file, selection, diagnostics, etc.).
-- The actual model + API key live in ~/.config/opencode/opencode.jsonc and
-- $DEEPSEEK_API_KEY from your shell rc.
return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      {
        "folke/snacks.nvim",
        opts = { input = {}, picker = {} },
      },
    },
    -- autoread lets the buffer pick up file edits opencode makes on disk
    init = function()
      vim.o.autoread = true
    end,
    config = function()
      vim.g.opencode_opts = {}
    end,
    keys = {
      { "<leader>oo", function() require("opencode").toggle() end,                    desc = "Opencode: toggle panel" },
      { "<leader>oa", function() require("opencode").ask("@cursor: ") end,            desc = "Opencode: ask about cursor", mode = "n" },
      { "<leader>oa", function() require("opencode").ask("@selection: ") end,         desc = "Opencode: ask about selection", mode = "v" },
      { "<leader>o+", function() require("opencode").prompt("@buffer", { append = true }) end, desc = "Opencode: add buffer to prompt" },
      { "<leader>os", function() require("opencode").select() end,                    desc = "Opencode: pick prompt", mode = { "n", "v" } },
      { "<leader>on", function() require("opencode").command("session_new") end,      desc = "Opencode: new session" },
      { "<leader>oi", function() require("opencode").command("session_interrupt") end, desc = "Opencode: interrupt" },
      { "<leader>oe", function() require("opencode").prompt("Explain @selection in detail") end, desc = "Opencode: explain selection", mode = "v" },
      { "<S-C-u>",    function() require("opencode").command("messages_half_page_up") end,   desc = "Opencode: scroll up" },
      { "<S-C-d>",    function() require("opencode").command("messages_half_page_down") end, desc = "Opencode: scroll down" },
    },
  },
}
