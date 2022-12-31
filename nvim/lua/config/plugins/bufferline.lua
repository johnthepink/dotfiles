local bufferline = {
  "akinsho/nvim-bufferline.lua",
  event = "BufReadPre",
  keys = {
    { "gb", ":BufferLinePick<cr>" },
  },
}

function bufferline.config()
  vim.api.nvim_exec([[let $KITTY_WINDOW_ID=0]], true)

  require("bufferline").setup()
end

return bufferline
