local o = vim.opt

o.exrc = true
o.relativenumber = true
o.nu = true
o.hlsearch = false
o.mouse = "a"
o.hidden = true
o.splitright = true
o.splitbelow = true
o.errorbells = false
o.wrap = false
o.formatoptions:remove({ "t" })
o.ignorecase = true
o.smartcase = true
o.swapfile = false
o.backup = false
o.undodir = "/Users/john/.vim/undodir"
o.undofile = true
o.incsearch = true
o.termguicolors = true
o.scrolloff = 2
-- o.showmode = false
o.completeopt = { "menu", "menuone", "noselect" }
o.signcolumn = "yes"
o.number = true
o.updatetime = 50
o.encoding = "UTF-8"
o.clipboard:append({ "unnamedplus" })
o.joinspaces = false
o.showcmd = true
o.wildignore:append({ "*/node_modules/**" })
o.foldlevel = 20
o.foldmethod = "manual"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.ttyfast = true
-- o.lazyredraw = true
o.spelllang = "en_us"
