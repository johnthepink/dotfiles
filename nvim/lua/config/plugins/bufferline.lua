return {
  "akinsho/bufferline.nvim",
  event = "BufReadPre",
  keys = {
    {
      "gb",
      function()
        require("bufferline").pick()
      end,
    },
  },
  opts = {
    options = {
      offsets = {
        { filetype = "neo-tree" },
      },
    },
  },
}
