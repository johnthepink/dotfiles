local map = vim.keymap.set
local cmd = vim.cmd

map("n", "<leader>l", cmd.Lazy)
map("n", "Q", "<nop>")
map("n", "q", "<nop>")
map("n", "<leader>,", cmd.bnext)
map("n", "<leader>.", cmd.bprevious)
map("n", "<leader>tn", ":set relativenumber!<cr>")
map("n", "<leader>tw", ":set wrap!<cr>")
map("n", "<leader>tl", ":set linebreak!<cr>")
map("n", "<leader>ts", ":set spell!<cr>")
map("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<C-g>", "<cmd>silent !tmux neww repome<CR>")
