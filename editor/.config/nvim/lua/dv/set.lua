vim.opt.mouse = nil

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.swapfile = true
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backup"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.list = true
vim.opt.listchars = {
  eol = '¬',
  tab = '»»',
  trail = '~',
  extends = '>',
  precedes = '<',
  space = '·'
}

vim.opt.ignorecase = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 3

vim.opt.spelllang = "en,cjk"
vim.opt.spellsuggest = "best,9"

vim.opt.colorcolumn = "120"

vim.opt.shell = "/bin/bash -i"
