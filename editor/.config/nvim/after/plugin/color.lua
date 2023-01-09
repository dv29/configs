vim.g.jellybeans_overrides = {
  SpecialKey = {
    guifg = '333333',
    ctermfg = 'grey',
  },
  NonText = {
    guifg = '333333',
    ctermfg = 'grey',
  },
  background = { guibg = '000000' },
  ColorColumn = { guibg = '111111' },
}

function SetColor()
  color = color or "jellybeans"
  vim.cmd.colorscheme(color)
end

SetColor()
