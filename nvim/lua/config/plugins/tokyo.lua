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
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = { italic = true },
      variables = {},
    },
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
