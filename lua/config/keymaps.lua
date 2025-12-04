local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Buffer management
keymap("n", "<leader>ba", ":enew<CR>", { noremap = true, silent = true, desc = "New buffer" })
keymap("n", "<leader>bc", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close buffer" })
keymap("n", "bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
keymap("n", "bp", ":bprevious<CR>", { noremap = true, silent = true, desc = "Prev buffer" })
keymap("n", "bc", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close buffer" })

-- Stay in indent mode (visual)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Clear search highlights
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)
