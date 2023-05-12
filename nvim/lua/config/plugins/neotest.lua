return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "zidhuss/neotest-minitest",
  },
  keys = {
    "<leader>rr",
    "<leader>ra",
    "<leader>rs",
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-minitest"),
      },
    })

    vim.keymap.set("n", "<leader>rr", function()
      neotest.run.run()
    end)
    vim.keymap.set("n", "<leader>ra", function()
      neotest.run.run(vim.fn.expand("%"))
    end)
    vim.keymap.set("n", "<leader>rs", function()
      neotest.summary.toggle()
    end)
  end,
}
