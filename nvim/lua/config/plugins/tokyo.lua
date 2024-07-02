local tokyo = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm",
    lualine_bold = true,
  },
}

function tokyo.config(_, opts)
  require("tokyonight").setup(opts)

  vim.cmd.colorscheme("tokyonight")
end

return tokyo
