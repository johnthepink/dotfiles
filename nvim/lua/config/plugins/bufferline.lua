local bufferline = {
  "akinsho/nvim-bufferline.lua",
  event = "BufReadPre",
  keys = {
    { "gb", ":BufferLinePick<cr>" },
  },
}

function bufferline.config()
  vim.api.nvim_exec([[let $KITTY_WINDOW_ID=0]], true)

  require("bufferline").setup({
    highlights = {
      fill = {
        bg = "#282828"
      },
      separator_selected = {
        fg = "#282828"
      },
      separator_visible = {
        fg = "#282828"
      },
      separator = {
        fg = "#282828"
      }
    },
    options = {
      modified_icon = "●",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 25,
      max_prefix_length = 25,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      show_close_icon = false,
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count..")"
      end,
      offsets = {
        {
          filetype = "coc-explorer",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "center"
        }
      }
    }
  })
end

return bufferline
