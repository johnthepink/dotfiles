return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  cmd = 'Neotree',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  keys = {
    {
      '<leader>d',
      function()
        require('neo-tree.command').execute({ toggle = true, reveal = true })
      end,
      desc = 'Explorer NeoTree (root dir)',
    },
    {
      '<leader>b',
      function()
        require('neo-tree.command').execute({ source = 'buffers', toggle = true, reveal = true })
      end,
      desc = 'Explorer NeoTree (root dir)',
    },
    {
      '<leader>gs',
      function()
        require('neo-tree.command').execute({ source = 'git_status', toggle = true, reveal = true })
      end,
      desc = 'Explorer NeoTree (root dir)',
    },
  },
  opts = {
    enable_diagnostics = true,
    window = {
      width = 40,
      mappings = {
        ['/'] = 'noop', -- "noop" removes a default mapping
      },
    },
    source_selector = {
      statusline = true,
      sources = {
        { source = 'filesystem', display_name = ' 󰉓 ' },
        { source = 'buffers', display_name = ' 󰈙 ' },
        { source = 'git_status', display_name = ' 󰊢 ' },
      },
      content_layout = 'center',
    },
    event_handlers = {
      {
        event = 'file_opened',
        handler = function(_)
          require('neo-tree.command').execute({ action = 'close' })
        end,
      },
    },
  },
  init = function()
    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd

    vim.g.neo_tree_remove_legacy_commands = 1

    autocmd('VimEnter', {
      group = augroup('Enter', {}),
      nested = true,
      callback = function()
        require('neo-tree.command').execute({ toggle = true, reveal = true })
      end,
    })
  end,
}
