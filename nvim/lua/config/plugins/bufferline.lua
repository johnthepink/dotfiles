local bufferline = {
  "akinsho/bufferline.nvim",
  event = "BufReadPre",
  keys = {
    { "gb", ":BufferLinePick<cr>" },
  },
}

function bufferline.config()
  vim.api.nvim_exec([[let $KITTY_WINDOW_ID=0]], true)

  require("bufferline").setup({
    options = {
      offsets = {
        { filetype = "neo-tree" },
      },
    },
  })
end

return bufferline
