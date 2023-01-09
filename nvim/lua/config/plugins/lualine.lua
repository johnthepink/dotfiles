local M = {
  "nvim-lualine/lualine.nvim",
  event = "BufReadPre",
}

function M.config()
  local nvim_tree_shift = {
    function()
      local win = require("nvim-tree.view").get_winnr() or 0
      return string.rep(" ", vim.api.nvim_win_get_width(win) - 1)
    end,
    cond = require("nvim-tree.view").is_visible,
    color = "NvimTreeNormal",
  }

  require("lualine").setup({
    options = {
      theme = "tokyonight",
    },
    sections = {
      lualine_a = { nvim_tree_shift, "mode" }, -- dont show when tree open
      lualine_x = { "filetype" }, -- remove encoding and format
    },
  })
end

return M
