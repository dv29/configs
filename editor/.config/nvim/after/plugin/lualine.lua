vim.opt.showmode = false;

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_b = {},
    lualine_c = { { 'filename', path = 1 } }
  },
  inactive_sections = {
    lualine_c = { { 'filename', path = 1 } },
  },
}
