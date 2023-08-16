local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "David-Kunz/cmp-npm",
  },
}

function M.config()
  local cmp = require("cmp")

  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      --['<C-Space>'] = cmp.mapping.complete(),
      ["<C-x>"] = cmp.mapping.complete({}),
      ["<C-e>"] = cmp.mapping.close(),
      --['<CR>'] = cmp.mapping.confirm({ select = false }),
      ["<C-y>"] = cmp.mapping.confirm({
        select = true,
      }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer", keywork_length = 5 },
      { name = "npm", keyword_length = 4 },
    }),
    formatting = {
      format = require("lspkind").cmp_format({
        mode = "symbol",
        menu = {
          buffer = "buf",
          nvim_lsp = "lsp",
          path = "path",
          npm = "npm",
        },
      }),
    },
    experimental = {
      ghost_text = true,
    },
  })
end

return M
