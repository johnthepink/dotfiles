local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "David-Kunz/cmp-npm",
  },
}

function M.config()
  local cmp = require("cmp")

  cmp.setup({
    auto_select = false,
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      --['<C-Space>'] = cmp.mapping.complete(),
      ['<C-x>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      --['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<C-y>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,        
        select = true
      }),
    }),
    sources = {
      { name = 'nvim_lsp' },
      -- For vsnip user.
      -- { name = 'vsnip' },
      -- For luasnip user.
      { name = 'path' },
      -- For ultisnips user.
      -- { name = 'ultisnips' },
      { name = 'luasnip' },
      { name = 'buffer', keywork_length = 5 },
      { name = 'npm', keyword_length = 4 },
    },
    formatting = {
      -- format = require('lspkind').cmp_format {
      --   with_text = true,
      --   menu = {
      --     buffer = "[buf]",
      --     nvim_lsp = "[LSP]",
      --     path = "[path]",
      --     luasnip = "[snip]"
      --   }
      -- }
    },
    experimental = {
      native_menu = false,
      ghost_text = true
    }
  })
end

return M
