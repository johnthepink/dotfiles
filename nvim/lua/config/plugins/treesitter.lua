local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "html",
      "javascript",
      "typescript",
      "tsx",
      "css",
      "json",
      "graphql",
      "prisma",
      "hcl",
      -- these are required since neovim 0.8
      "c",
      "lua",
      "vim",
      "help",
    },
    -- ensure_installed = "all", -- or maintained
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = false,
    },
    context_commentstring = {
      enable = true,
    },
  })
end

return M