local zen = {
  "Pocco81/true-zen.nvim",
  keys = {
    { "<leader>zn", "<cmd>TZNarrow<cr>" },
    { "<leader>zn", "<cmd>'<,'>TZNarrow<cr>", mode = "v" },
    { "<leader>zf", "<cmd>TZFocus<cr>" },
    { "<leader>zm", "<cmd>TZMinimalist<cr>" },
    { "<leader>za", "<cmd>TZAtaraxis<cr>" },
  },
}

function zen.config()
  require("true-zen").setup({
    integrations = {
      twilight = false, -- enable twilight (ataraxis)
      lualine = true,   -- hide nvim-lualine (ataraxis)
    },
    modes = {
      ataraxis = {
        callbacks = {
          open_pre = function()
            local o = vim.opt
            o.wrap = true
            o.linebreak = true
          end,
          close_pos = function()
            local o = vim.opt
            o.spell = false
            o.wrap = false
            o.linebreak = false
          end,
        },
      },
    },
  })
end

return zen
