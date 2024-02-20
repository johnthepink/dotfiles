local tokyo = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm",
    lualine_bold = true,
    on_colors = function(colors)
      colors.gitSigns.add = colors.green
      colors.gitSigns.delete = colors.red
      colors.gitSigns.change = colors.orange
    end,
    on_highlights = function(highlights)
      highlights["@tag.tsx"].fg = '#2ac3de'
    end
  },
}

function tokyo.config(_, opts)
  require("tokyonight").setup(opts)

  vim.cmd.colorscheme("tokyonight")
end

return tokyo
