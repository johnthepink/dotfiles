return {
  "nvim-tree/nvim-web-devicons",
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  {
    'mrjones2014/smart-splits.nvim',
    opts = {
      at_edge = 'stop',
    },
  },
  {
    "ruifm/gitlinker.nvim",
    keys = {
      "<leader>gy",
      "<leader>gb",
      { "<leader>gy", mode = "v" },
      { "<leader>gb", mode = "v" },
    },
    config = function()
      local gitlinker = require("gitlinker")
      local open_in_browser = require("gitlinker.actions").open_in_browser
      gitlinker.setup({
        opts = {
          add_current_line_on_normal_mode = false,
        },
      })

      vim.keymap.set("n", "<leader>gb", function()
        gitlinker.get_buf_range_url("n", { action_callback = open_in_browser })
      end)
      vim.keymap.set("v", "<leader>gb", function()
        gitlinker.get_buf_range_url("v", { action_callback = open_in_browser })
      end)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = true,
  },
  {
    "opdavies/toggle-checkbox.nvim",
    keys = {
      "<leader>tt",
    },
    config = function()
      local tc = require("toggle-checkbox")
      vim.keymap.set("n", "<leader>tt", function()
        tc.toggle()
      end)
    end,
  },
}
