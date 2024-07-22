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
  LspInlayHint = {
    guifg = '404040',
    guibg = 'NONE',
    ctermfg = 'grey',
    ctermbg = 'NONE',
    italic = true,
  }
}

function SetColor()
  color = color or "jellybeans"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "#1D1D1D" })
end

SetColor()
