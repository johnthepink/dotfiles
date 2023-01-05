local tokyo = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
}

function tokyo.config()
  require("tokyonight").setup({
    style = "storm",
    lualine_bold = true,
    on_colors = function(colors)
      colors.gitSigns.add = colors.green
      colors.gitSigns.delete = colors.red
      colors.gitSigns.change = colors.orange
    end,
  })

  vim.cmd([[
    colorscheme tokyonight

    augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
    augroup END
  ]])
end

return tokyo
