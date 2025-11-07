return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    {
      'folke/snacks.nvim',
      opts = { input = { enabled = true }, picker = { enabled = true }, terminal = { enabled = true } },
    },
  },
  config = function()
    vim.opt.autoread = true
  end,
  keys = {
    {
      '<leader>oa',
      function()
        require('opencode').ask('@this: ', { submit = true })
      end,
      desc = 'Ask about this',
      mode = { 'n', 'v' },
    },
    {
      '<leader>os',
      function()
        require('opencode').select()
      end,
      desc = 'Select prompt',
      mode = { 'n', 'v' },
    },
    {
      '<leader>o+',
      function()
        require('opencode').prompt('@this')
      end,
      desc = 'Add this',
      mode = { 'n', 'v' },
    },
  },
}
