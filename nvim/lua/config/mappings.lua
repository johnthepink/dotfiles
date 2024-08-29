local smart_splits = require('smart-splits')
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
map("n", "<leader>ti", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

map('n', '<C-h>', smart_splits.move_cursor_left)
map('n', '<C-j>', smart_splits.move_cursor_down)
map('n', '<C-k>', smart_splits.move_cursor_up)
map('n', '<C-l>', smart_splits.move_cursor_right)

-- run all rails tests in new tmux pane
map("n", "<leader>qq", "<cmd>silent !wezterm cli spawn --cwd $(pwd) -- zsh -c 'bin/rails test; read'<cr>")
-- run current buffer rails tests
map("n", "<leader>qf", function()
  local path = vim.fn.expand("%:p")
  return "<cmd>silent !wezterm cli spawn --cwd $(pwd) -- zsh -c 'bin/rails test " .. path .. "; read'<cr>"
end, { expr = true })
-- run current buffer rails test at cursor position
map("n", "<leader>ql", function()
  local path = vim.fn.expand("%:p")
  local position = vim.fn.getcurpos()[2]
  return "<cmd>silent !wezterm cli spawn --cwd $(pwd) -- zsh -c 'bin/rails test " ..
      path .. ":" .. position .. "; read'<cr>"
end, { expr = true })
