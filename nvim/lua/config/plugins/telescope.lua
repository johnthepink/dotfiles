local M = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    "gca",
    "<leader>ps",
    "<leader>ff",
    "<leader>fb",
    "<leader>fc",
    -- "<leader>cb",
    "<leader>fr",
    "<leader>fg",
    "<leader>pp",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
}

function M.setup_keys()
  local ts = require("telescope.builtin")

  vim.keymap.set("n", "gca", function()
    vim.lsp.buf.code_action()
  end)
  vim.keymap.set("n", "<leader>ps", function()
    ts.grep_string({ search = vim.fn.input({ prompt = "Grep for >" }) })
  end)
  vim.keymap.set("n", "<leader>ff", function()
    ts.find_files({ hidden = true, file_ignore_patterns = { ".git/" } })
  end)
  vim.keymap.set("n", "<leader>fb", function()
    ts.buffers()
  end)
  vim.keymap.set("n", "<leader>fc", function()
    ts.git_status()
  end)
  -- vim.keymap.set("n", "<leader>cb", function()
  --   ts.git_branches()
  -- end)
  vim.keymap.set("n", "<leader>fr", function()
    ts.resume()
  end)
  vim.keymap.set("n", "<leader>fg", function()
    ts.live_grep({ file_ignore_patterns = {} })
  end)
  vim.keymap.set("n", "<leader>pp", function()
    ts.planets()
  end)
end

function M.config()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  local trouble = require("trouble.providers.telescope")

  telescope.setup({
    defaults = {
      file_ignore_patterns = { "yarn.lock" },
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
          ["<C-t>"] = trouble.smart_open_with_trouble,
        },
        n = {
          ["<C-t>"] = trouble.smart_open_with_trouble,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = false,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      ["ui-select"] = {
        themes.get_cursor(),
      },
    },
    pickers = {
      buffers = {
        show_all_buffers = true,
        sort_lastused = true,
        -- theme = "dropdown",
        -- previewer = false,
        mappings = {
          i = {
            ["<M-d>"] = "delete_buffer",
          },
        },
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("ui-select")

  M.setup_keys()
end

return M
