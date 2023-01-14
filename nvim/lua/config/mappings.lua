local map = vim.keymap.set

map("n", "<leader>l", ":Lazy<cr>")
map("n", "<leader>sv", ":source $MYVIMRC<cr>")
map("n", "Q", "<nop>")
map("n", "q", "<nop>")
map("n", "<leader>,", ":bnext<CR>")
map("n", "<leader>.", ":bprevious<CR>")
map("n", "<leader>tn", ":set invrelativenumber<cr>")
map("n", "<leader>tw", ":set wrap!<cr>")
map("n", "<leader>tl", ":set linebreak!<cr>")
map("n", "<leader>ts", ":set spell!<cr>")
