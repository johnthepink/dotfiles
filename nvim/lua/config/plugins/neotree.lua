return {
  "nvim-neo-tree/neo-tree.nvim",

  cmd = "Neotree",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },

  keys = {
    {
      "<leader>d",
      function()
        require("neo-tree.command").execute({ toggle = true, reveal = true })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
  },

  config = {
    enable_diagnostics = false,
    window = {
      width = 40,
    },
    source_selector = {
      statusline = true,
      tab_labels = { -- falls back to source_name if nil
        filesystem = "",
        buffers = "",
        git_status = "",
        diagnostics = "裂",
      },
      content_layout = "center",
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          require("neo-tree").close_all()
        end,
      },
    },
  },

  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree.command").execute({ toggle = true, reveal = true })
      end
    end
  end,
}
