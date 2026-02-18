return {
  'nvim-tree/nvim-web-devicons',
  {
    'mrjones2014/smart-splits.nvim',
    opts = {
      at_edge = 'stop',
    },
  },
  {
    'ruifm/gitlinker.nvim',
    keys = {
      '<leader>gy',
      '<leader>gb',
      { '<leader>gy', mode = 'v' },
      { '<leader>gb', mode = 'v' },
    },
    config = function()
      local gitlinker = require('gitlinker')
      local open_in_browser = require('gitlinker.actions').open_in_browser
      local hosts = require('gitlinker.hosts')
      gitlinker.setup({
        opts = {
          add_current_line_on_normal_mode = false,
        },
        callbacks = {
          ['forgejo.jolo.pink'] = hosts.get_gitea_type_url,
        },
      })

      vim.keymap.set('n', '<leader>gb', function()
        gitlinker.get_buf_range_url('n', { action_callback = open_in_browser })
      end)
      vim.keymap.set('v', '<leader>gb', function()
        gitlinker.get_buf_range_url('v', { action_callback = open_in_browser })
      end)
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup({
        on_attach = function(buffer)
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = buffer
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          map('n', '<leader>tb', gitsigns.blame)
        end,
      })
    end,
  },
  {
    'opdavies/toggle-checkbox.nvim',
    keys = {
      '<leader>tt',
    },
    config = function()
      local tc = require('toggle-checkbox')
      vim.keymap.set('n', '<leader>tt', function()
        tc.toggle()
      end)
    end,
  },
  { 'qvalentin/helm-ls.nvim', ft = 'helm' },
}
