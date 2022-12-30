local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy"
}

function M.config()
  require('lualine').setup({
    options = {
      theme = 'dracula',
      disabled_types = { 'NvimTree' }
    },
    -- sections = {
      -- lualine_x = {},
      -- lualine_y = {},
      -- lualine_z = {},
    -- }
  })
end

return M
