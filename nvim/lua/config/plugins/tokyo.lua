local tokyo = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  commit = "096543e112744eb94947cc3c5a916fff1deea2f0",
  opts = {
    style = "storm",
    lualine_bold = true,
    on_colors = function(colors)
      colors.gitSigns.add = colors.green
      colors.gitSigns.delete = colors.red
      colors.gitSigns.change = colors.orange
    end,
  },
}

function tokyo.config(_, opts)
  require("tokyonight").setup(opts)

  vim.cmd.colorscheme("tokyonight")
end

return tokyo
