local M = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    { "gca", "<cmd>:Telescope lsp_code_actions<CR>" },
    { "<leader>ps", ":lua require('telescope.builtin').grep_string( { search = vim.fn.input('Grep for > ') } )<cr>" },
    { "<leader>ff", ":lua require'telescope.builtin'.find_files{ hidden = true, file_ignore_patterns = { '.git/' } }<cr>" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    { "<Leader>fs", ":lua require'telescope.builtin'.file_browser{ cwd = vim.fn.expand('%:p:h') }<cr>" },
    { "<Leader>fc", ":lua require'telescope.builtin'.git_status{}<cr>" },
    { "<Leader>cb", ":lua require'telescope.builtin'.git_branches{}<cr>" },
    { "<leader>fr", ":lua require'telescope.builtin'.resume{}<CR>" },
    { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep( { file_ignore_patterns = { '**/*.spec.js' } } )<cr>" },
    { "<leader>fgd", ":lua require'telescope.builtin'.live_grep{ search_dirs = { 'slices/admin' } }" },
    { "<leader>fw", "<cmd>Telescope tmux windows<cr>" },
  },
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
}

function M.config()
  local telescope = require("telescope")

  telescope.setup {
    defaults = {
      file_ignore_patterns = { "yarn.lock" },
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = false,
        override_file_sorter = true,
        case_mode = "smart_case"
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
          }
        }
      }
    }
  }

  telescope.load_extension('fzf')
end

return M
