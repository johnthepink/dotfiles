local M = {
  "nvim-lualine/lualine.nvim",
  event = "BufReadPre",
}

function M.config()
  require("lualine").setup({
    options = {
      theme = "auto",
      disabled_filetypes = {
        "NvimTree",
      },
    },
    sections = {
      lualine_a = { "mode" }, -- dont show when tree open
      lualine_x = { "filetype" }, -- remove encoding and format
    },
  })
end

return M
