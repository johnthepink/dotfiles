local M = {
  "kyazdani42/nvim-tree.lua",
  event = "VeryLazy",
  keys = { "<leader>d", "<leader>r" },
  enabled = false,
}

function M.setup_keys()
  local api = require("nvim-tree.api")

  vim.keymap.set("n", "<leader>d", function()
    api.tree.toggle({ find_file = true, focus = true })
  end)

  vim.keymap.set("n", "<leader>r", function()
    api.tree.reload()
  end)
end

function M.config()
  require("nvim-tree").setup({
    -- lsp_diagnostics = true,
    git = {
      ignore = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      highlight_git = true,
      highlight_opened_files = "icon",
      group_empty = true,
    },
  })

  vim.cmd([[ command! -nargs=1 Browse silent exec '!open "<args>"' ]])

  M.setup_keys()
end

return M
