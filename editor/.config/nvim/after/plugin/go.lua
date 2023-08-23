-- setup your go.nvim
-- make sure lsp_cfg is disabled
require("mason").setup()
require("mason-lspconfig").setup()
require('go').setup {
  lsp_cfg = false,
}
local cfg = require 'go.lsp'.config()

local on_attach = cfg.on_attach

cfg.on_attach = function(client, bufnr)
  on_attach(client, bufnr)
  vim.keymap.del('n', '<leader>ff', { buffer = bufnr })
end

require('lspconfig').gopls.setup(cfg)
