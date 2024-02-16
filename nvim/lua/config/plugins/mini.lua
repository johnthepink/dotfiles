local mini = {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
}

local specs = {
  mini,
  { "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } }
}

function mini.surround()
  require("mini.surround").setup({})
end

function mini.comment()
  require("mini.comment").setup({
    options = {
      custom_commentstring = function()
        return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
      end,
    },
  })
end

function mini.config()
  mini.surround()
  mini.comment()
end

return specs
