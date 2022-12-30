local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  pin = true,
  keys = {
    { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
    { "gh", "<cmd>lua vim.lsp.buf.hover()<CR>" },
    { "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
    { "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
    { "gr", "<cmd>lua vim.lsp.buf.references()<CR>" },
    { "gR", "<cmd>lua vim.lsp.buf.rename()<CR>" },
    { "<leader>fo", "<cmd>lua vim.lsp.buf.formatting()<CR>" },
  },
}

function M.config()
  local lsp = require "lspconfig"
  lsp.tsserver.setup({})
  lsp.eslint.setup({})

  local nls = require("config/plugins/null-ls")
  nls.setup()
end

return M
