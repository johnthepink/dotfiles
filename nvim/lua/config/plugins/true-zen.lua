local zen = {
  "Pocco81/true-zen.nvim",
  keys = {
    { "<leader>zn", ":TZNarrow<CR>" },
    { "<leader>zn", ":'<,'>TZNarrow<CR>", mode = "v" },
    { "<leader>zf", ":TZFocus<CR>" },
    { "<leader>zm", ":TZMinimalist<CR>" },
    { "<leader>za", ":TZAtaraxis<CR>" },
  },
}

function zen.config()
  -- true zen isn't able to detect in my setup when the tmux status bar is showing
  -- prior to the status being set. something about this isn't working correct:
  -- https://github.com/Pocco81/true-zen.nvim/blob/main/lua/true-zen/integrations/tmux.lua#L7-L13
  vim.cmd([[silent !tmux set status on]])

  require("true-zen").setup({
    integrations = {
      tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
      kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
        enabled = true,
        font = "+4",
      },
      twilight = false, -- enable twilight (ataraxis)
      lualine = true, -- hide nvim-lualine (ataraxis)
    },
  })
end

return zen
