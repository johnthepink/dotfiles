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

function M.diagnostics()
  -- Automatically update diagnostics
  vim.diagnostic.config({
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  })

  local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

function M.config()
  M.diagnostics()

  local lsp = require "lspconfig"
  lsp.tsserver.setup({})
  lsp.eslint.setup({})

  local nls = require("config/plugins/null-ls")
  nls.setup()
end

return M
