local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

-- this is called form within the lsp config,
-- which is why this is named setup instead of config
-- so it is not auto run by lazy
function M.setup()
  local null_ls = require("null-ls")

  local sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.formatting.stylua,
  }

  local augroup = vim.api.nvim_create_augroup
  local autocmd = vim.api.nvim_create_autocmd

  local function on_attach(client, buffer)
    print("Attached to " .. client.name)

    if client.server_capabilities.documentFormattingProvider then
      autocmd("BufWritePre", {
        group = augroup("Format", {}),
        buffer = buffer,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end

  null_ls.setup({
    sources = sources,
    on_attach = on_attach,
  })
end

return M
