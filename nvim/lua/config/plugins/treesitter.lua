return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    ensure_installed = {
      "bash",
      "css",
      "dockerfile",
      "embedded_template",
      "graphql",
      "hcl",
      "html",
      "java",
      "javascript",
      "json",
      "markdown",
      "markdown_inline",
      "prisma",
      "python",
      "regex",
      "ruby",
      "sql",
      "terraform",
      "tsx",
      "typescript",
      "yaml",
      -- these are required since neovim 0.8
      "c",
      "lua",
      "vim",
      "vimdoc",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
