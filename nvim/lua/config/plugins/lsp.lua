local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  keys = {
    { "gd", vim.lsp.buf.definition },
    { "gh", vim.lsp.buf.hover },
    { "gD", vim.lsp.buf.implementation },
    { "gk", vim.lsp.buf.signature_help },
    { "gp", vim.diagnostic.open_float },
    {
      "<leader>fo",
      function()
        vim.lsp.buf.format({ async = true })
      end,
    },
    { "<leader>fi" },
  },
}

function M.organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

function M.config()
  vim.keymap.set("n", "<leader>fi", function()
    M.organize_imports()
  end)

  local lsp = require("lspconfig")
  -- npm i -g neovim typescript typescript-language-server
  lsp.ts_ls.setup({
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = false,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = false,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    }
  })
  -- npm i -g vscode-langservers-extracted
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
  -- gem install neovim ruby-lsp
  lsp.ruby_lsp.setup({})
  -- gem install rubocop
  lsp.rubocop.setup({})
  -- npm i -g graphql-language-service-cli
  lsp.graphql.setup({})

  local nls = require("config/plugins/null-ls")
  nls.setup()

  vim.lsp.inlay_hint.enable(true);
end

return M
