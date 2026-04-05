return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = 'main',
  lazy = false,
  dependencies = { 'OXY2DEV/markview.nvim' },
  opts = {
    languages = {
      'bash',
      'css',
      'dockerfile',
      'embedded_template',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'gomod',
      'gosum',
      'gowork',
      'graphql',
      'hcl',
      'helm',
      'html',
      'java',
      'javascript',
      'json',
      'latex',
      'make',
      'markdown',
      'markdown_inline',
      'prisma',
      'python',
      'regex',
      'ruby',
      'rust',
      'ssh_config',
      'sql',
      'terraform',
      'tsx',
      'typescript',
      'yaml',
      'xml',
      -- these are required since neovim 0.8
      'c',
      'lua',
      'vim',
      'vimdoc',
    },
  },
  config = function(_, opts)
    local ts = require('nvim-treesitter')
    ts.install(opts.languages)

    local installed = ts.get_installed('parsers')
    local ts_start = vim.api.nvim_create_augroup('treesitter-start-files', {})

    for _, parser in pairs(installed) do
      local filetypes = vim.treesitter.language.get_filetypes(parser)
      vim.api.nvim_create_autocmd('FileType', {
        group = ts_start,
        pattern = filetypes,
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end
  end,
}
