return {
  "folke/trouble.nvim",
  config = true,
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
    { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>" },
    { "gr",         "<cmd>Trouble lsp toggle focus=false<cr>" },
  },
}
