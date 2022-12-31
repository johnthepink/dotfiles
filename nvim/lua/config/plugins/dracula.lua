local M = {
  "dracula/vim",
  name = "dracula",
  lazy = false,
  priority = 1000,
  enabled = false,
}

function M.config()
  vim.g.dracula_colorterm = 0
  vim.g.dracula_italic = 1
  vim.cmd([[
    colorscheme dracula
    highlight Cursor guifg=#f00 guibg=#657b83
    highlight Comment cterm=italic gui=italic

    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
    augroup END
  ]])
end

return M
