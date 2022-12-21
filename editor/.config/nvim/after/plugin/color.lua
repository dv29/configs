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

  -- CursorLine = { guifg = 'ffffff', guibg = 'ffffff', ctermbg = 'ffffff', ctermfg = 'ffffff' },
  -- CursorLineNr = { guifg = 'ffffff', guibg = 'ffffff', ctermbg = 'ffffff', ctermfg = 'ffffff' },
  -- CursorColumn = { guifg = 'ffffff', guibg = 'ffffff', ctermbg = 'ffffff', ctermfg = 'ffffff' },
  -- Cursor = { guifg = 'ffffff', guibg = 'ffffff', ctermbg = 'ffffff', ctermfg = 'ffffff' },
  -- iCursor = { guifg = 'ffffff', guibg = 'ffffff', ctermbg = 'ffffff', ctermfg = 'ffffff' },
  -- TermCursor = { guifg = 'ffffff', guibg = 'ffffff', ctermbg = 'ffffff', ctermfg = 'ffffff' },
}

function SetColor()
  color = color or "jellybeans"
  vim.cmd.colorscheme(color)
end

SetColor()
