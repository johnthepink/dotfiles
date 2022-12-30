local M = {
  "jose-elias-alvarez/null-ls.nvim"
}

function M.setup()
  local null_ls = require "null-ls"

  local sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.terraform_fmt
  }

  local function on_attach(client)
    print('Attached to ' .. client.name)

    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync(nil, 5000)]]
      vim.api.nvim_command [[augroup END]]
    end
  end

  null_ls.setup({ 
    sources = sources,
    on_attach = on_attach
  })
end

return M
