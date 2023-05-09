return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>d",
      function()
        require("neo-tree.command").execute({ toggle = true, reveal = true })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    {
      "<leader>b",
      function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true, reveal = true })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    {
      "<leader>gs",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true, reveal = true })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
  },
  opts = {
    -- BEGIN nerd font 3.0 fix until https://github.com/nvim-neo-tree/neo-tree.nvim/pull/909
    default_component_configs = {
      icon = {
        folder_empty = "󰜌",
        folder_empty_open = "󰜌",
      },
      git_status = {
        symbols = {
          renamed = "󰁕",
          unstaged = "󰄱",
        },
      },
    },
    document_symbols = {
      kinds = {
        File = { icon = "󰈙", hl = "Tag" },
        Namespace = { icon = "󰌗", hl = "Include" },
        Package = { icon = "󰏖", hl = "Label" },
        Class = { icon = "󰌗", hl = "Include" },
        Property = { icon = "󰆧", hl = "@property" },
        Enum = { icon = "󰒻", hl = "@number" },
        Function = { icon = "󰊕", hl = "Function" },
        String = { icon = "󰀬", hl = "String" },
        Number = { icon = "󰎠", hl = "Number" },
        Array = { icon = "󰅪", hl = "Type" },
        Object = { icon = "󰅩", hl = "Type" },
        Key = { icon = "󰌋", hl = "" },
        Struct = { icon = "󰌗", hl = "Type" },
        Operator = { icon = "󰆕", hl = "Operator" },
        TypeParameter = { icon = "󰊄", hl = "Type" },
        StaticMethod = { icon = "󰠄 ", hl = "Function" },
      },
    },
    -- END nerd font 3.0 fix

    enable_diagnostics = false,
    window = {
      width = 40,
      mappings = {
        ["/"] = "noop", -- "noop" removes a default mapping
      },
    },
    source_selector = {
      statusline = true,
      sources = {
        { source = "filesystem", display_name = "Files" },
        { source = "buffers", display_name = "Buffers" },
        { source = "git_status", display_name = "Git" },
      },
      content_layout = "center",
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          require("neo-tree").close_all()
        end,
      },
    },
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(tostring(vim.fn.argv(0)))
      if stat and stat.type == "directory" then
        require("neo-tree.command").execute({ toggle = true, reveal = true })
      end
    end
  end,
}
