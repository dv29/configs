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
    guifg = 'C0C0C0',      -- Lighter grey for foreground
    guibg = 'NONE',        -- Keep background transparent if desired, or set a light background
    ctermfg = 'lightgrey', -- Lighter ctermfg
    ctermbg = 'NONE',
    italic = true,
  }
}

function SetColor()
  color = color or "jellybeans"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "#282828", fg = "#E0E0E0" }) -- Example: Lighter background and very light foreground
  -- vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "#1D1D1D" })
end

SetColor()

-- vim.g.jellybeans_overrides = {
--   SpecialKey = {
--     guifg = '333333',
--     ctermfg = 'grey',
--   },
--   NonText = {
--     guifg = '333333',
--     ctermfg = 'grey',
--   },
--   background = { guibg = '000000' },
--   ColorColumn = { guibg = '111111' },
--   LspInlayHint = {
--     ctermbg = 'NONE',
--     italic = true,
--   }
-- }
--
-- function SetColor()
--   color = color or "jellybeans"
--   vim.cmd.colorscheme(color)
--   -- Adjust the background here if you want a specific light background for inlay hints
--   -- For a very subtle light background, consider a color like '282828' or similar.
--   -- If you want it truly "lighter than the rest", consider the foreground.
--   vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "#222222", fg = "#C0C0C0" }) -- Example: slightly lighter background and even lighter foreground
-- end
--
-- SetColor()
