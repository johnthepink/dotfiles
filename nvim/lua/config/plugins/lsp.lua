local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  keys = {
    { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
    { "gh", "<cmd>lua vim.lsp.buf.hover()<CR>" },
    { "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
    { "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
    { "gp", "<cmd>lua vim.diagnostic.open_float()<CR>" },
    { "<leader>fo", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>" },
  },
  dependencies = {
    "folke/neodev.nvim",
  },
}

function M.diagnostics()
  -- Automatically update diagnostics
  vim.diagnostic.config({
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  })

  local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

function M.config()
  require("neodev").setup({})

  M.diagnostics()

  local lsp = require("lspconfig")
  lsp.tsserver.setup({})
  lsp.eslint.setup({
    filetypes = {
      -- defaults
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
      "svelte",
      "astro",
      -- added
      "graphql",
    },
  })
  lsp.lua_ls.setup({
    cmd = { "/Users/john/code/lua-language-server/bin/lua-language-server" },
  })
  lsp.solargraph.setup({})

  local nls = require("config/plugins/null-ls")
  nls.setup()
end

return M
