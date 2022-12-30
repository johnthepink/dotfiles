return {
  "kyazdani42/nvim-web-devicons",
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
  {
    "ruifm/gitlinker.nvim",
    keys = "<leader>gy",
    config = function()
      require("gitlinker").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "yamatsum/nvim-cursorline",
    event = "BufReadPre",
    config = function()
      require("nvim-cursorline").setup()
    end,
  },
}
