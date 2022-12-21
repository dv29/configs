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
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 3

vim.opt.spelllang = "en,cjk"
vim.opt.spellsuggest = "best,9"

vim.opt.colorcolumn = "120"

-- highlight Cursor guifg=white guibg=black
-- highlight iCursor guifg=white guibg=steelblue
-- vim.opt.guicursor:append {
--   "n-v-c:block-Cursor",
--   "n-v-c:blinkon0",
--   "i:ver100-iCursor",
--   "i:blinkwait10"
-- }

-- set guitablabel=%N\ %f
-- set autoread
-- set backspace=eol,indent,start
-- set completeopt-=preview
-- set foldmethod=syntax
-- set foldlevel=3
-- autocmd FileType yaml setlocal foldmethod=indent
