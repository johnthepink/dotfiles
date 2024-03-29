local M = {
  "nvim-lualine/lualine.nvim",
  event = "BufReadPre",
}

function M.config()
  require("lualine").setup({
    options = {
      disabled_filetypes = {
        "neo-tree",
      },
    },
    sections = {
      lualine_x = { "filetype" }, -- remove encoding and format
    },
  })
end

return M
