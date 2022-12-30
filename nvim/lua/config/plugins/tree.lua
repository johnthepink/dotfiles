local M = {
  "kyazdani42/nvim-tree.lua",
  event = "VeryLazy",
  cmd = "NvimTreeFindFileToggle",
  keys = {
    { "<leader>d", ":NvimTreeFindFileToggle<CR>" },
    { "<leader>r", ":NvimTreeRefresh<CR>" },
    { "<leader>n", ":NvimTreeFindFile<CR>" },
  },
}

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
end

return M
