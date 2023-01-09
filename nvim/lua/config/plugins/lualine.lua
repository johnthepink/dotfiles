local M = {
  "nvim-lualine/lualine.nvim",
  event = "BufReadPre",
}

function M.config()
  local nvim_tree_shift = {
    function()
      return string.rep(" ", vim.api.nvim_win_get_width(require("nvim-tree.view").get_winnr(0)) - 1)
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
