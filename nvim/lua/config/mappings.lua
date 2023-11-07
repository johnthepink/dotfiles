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
-- run all rails tests in new tmux pane
map("n", "<leader>qq", "<cmd>silent !tmux neww zsh -c 'bin/rails test; read'<cr>")
-- run current buffer rails tests
map("n", "<leader>qf", function()
  local path = vim.fn.expand("%:p")
  return "<cmd>silent !tmux neww zsh -c 'bin/rails test " .. path .. "; read'<cr>"
end, { expr = true })
-- run current buffer rails test at cursor position
map("n", "<leader>ql", function()
  local path = vim.fn.expand("%:p")
  local position = vim.fn.getcurpos()[2]
  return "<cmd>silent !tmux neww zsh -c 'bin/rails test " .. path .. ":" .. position .. "; read'<cr>"
end, { expr = true })
