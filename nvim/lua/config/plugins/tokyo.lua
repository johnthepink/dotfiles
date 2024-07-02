local tokyo = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm",
    lualine_bold = true,
    on_highlights = function(highlights, colors)
      highlights.GitSignsAdd.fg = colors.green
      highlights.GitSignsDelete.fg = colors.red
      highlights.GitSignsChange.fg = colors.orange
    end,
  },
}

function tokyo.config(_, opts)
  require("tokyonight").setup(opts)

  vim.cmd.colorscheme("tokyonight")
end

return tokyo
