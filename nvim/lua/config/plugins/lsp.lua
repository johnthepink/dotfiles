local M = {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  keys = {
    { 'gd', vim.lsp.buf.definition },
    { 'gh', vim.lsp.buf.hover },
    { 'gD', vim.lsp.buf.implementation },
    { 'gk', vim.lsp.buf.signature_help },
    { 'gp', vim.diagnostic.open_float },
    {
      '<leader>fo',
      function()
        vim.lsp.buf.format({ async = true })
      end,
    },
    { '<leader>fi' },
  },
}

function M.config()
  local enable = vim.lsp.enable

  -- npm i -g neovim typescript typescript-language-server
  enable('ts_ls')
  -- npm i -g vscode-langservers-extracted
  enable('eslint')
  enable('lua_ls')
  -- gem install neovim ruby-lsp
  enable('ruby_lsp')
  -- gem install rubocop
  enable('rubocop')
  -- npm i -g graphql-language-service-cli
  enable('graphql')
  enable('rust_analyzer')
  -- brew install helm-ls && npm i -g yaml-language-server
  enable('helm_ls')

  local nls = require('config/plugins/null-ls')
  nls.setup()

  vim.lsp.inlay_hint.enable(true)
end

return M
