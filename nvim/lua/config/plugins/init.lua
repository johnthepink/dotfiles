return {
  "glepnir/dashboard-nvim",
  {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init()
    end,
  },
  "L3MON4D3/LuaSnip",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  {
    "sudormrfbin/cheatsheet.nvim",
    cmd = "Cheatsheet",
    keys = {
      { "<leader>cheat", ":Cheatsheet<cr>" },
    },
  },
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
