-- claudecode.nvim — pure-Lua implementation of Claude Code's WebSocket MCP
-- protocol. The `claude` CLI (installed at ~/.local/bin/claude) connects to
-- Neovim as its IDE: it sees your selection, opens files, and shows edits as
-- native Neovim diffs you accept/reject. Terminal window is rendered by snacks.
-- Keymaps live under <leader>a (AI) to stay clear of opencode's <leader>o.
return {
  {
    "coder/claudecode.nvim",
    dependencies = {
      {
        "folke/snacks.nvim",
        opts = { input = {}, picker = {} },
      },
    },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude: toggle panel" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude: focus panel" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Claude: resume session" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Claude: continue last session" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Claude: select model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Claude: add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Claude: send selection" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Claude: add file from tree",
        ft = { "neo-tree", "netrw" },
      },
      -- Diff management (when Claude proposes an edit)
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Claude: accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Claude: deny diff" },
    },
  },
}
