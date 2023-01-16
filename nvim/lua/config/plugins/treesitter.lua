return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  opts = {
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
      "markdown",
      -- these are required since neovim 0.8
      "c",
      "lua",
      "vim",
      "help",
    },
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
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
