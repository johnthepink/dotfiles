local zen = {
  "Pocco81/true-zen.nvim",
  keys = {
    { "<leader>zn", "<cmd>TZNarrow<cr>" },
    { "<leader>zn", "<cmd>'<,'>TZNarrow<cr>", mode = "v" },
    { "<leader>zf", "<cmd>TZFocus<cr>" },
    { "<leader>zm", "<cmd>TZMinimalist<cr>" },
    { "<leader>za", "<cmd>TZAtaraxis<cr>" },
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
      kitty = {
        -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
        enabled = true,
        font = "+4",
      },
      twilight = false, -- enable twilight (ataraxis)
      lualine = true, -- hide nvim-lualine (ataraxis)
    },
    modes = {
      ataraxis = {
        callbacks = {
          open_pre = function()
            local o = vim.opt
            o.wrap = true
            o.linebreak = true
          end,
          close_pos = function()
            local o = vim.opt
            o.spell = false
            o.wrap = false
            o.linebreak = false
          end,
        },
      },
    },
  })
end

return zen
