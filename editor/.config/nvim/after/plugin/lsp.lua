local lspconfig = require 'lspconfig'
local lsp = require("lsp-zero")
-- .preset({
--   suggest_lsp_servers = true,
--   sign_icons = {
--     error = 'E',
--     warn = 'W',
--     hint = 'H',
--     info = 'I'
--   }
-- })

-- Function to toggle inlay hints
function ToggleInlayHints()
  local enabled = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not enabled)
end

local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gv", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<leader>sh", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>rd", "<cmd>RustOpenExternalDocs<Cr>", opts)


  -- if golang set another keymap
  if client.name == 'gopls' then
    -- Keymap to toggle inlay hints
    vim.keymap.set('n', '<leader>th', ':lua ToggleInlayHints()<CR>', { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>dc", ":GoDoc<CR><C-w><C-w>", opts)
  end
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

lsp.setup()

require('go').setup {
  lsp_cfg = false,
  lsp_inlay_hints = {
    enable = false,
    only_current_line = true,
  }
}
local cfg = require 'go.lsp'.config()

local on_attach = cfg.on_attach

cfg.on_attach = function(client, bufnr)
  on_attach(client, bufnr)
  vim.keymap.del('n', '<leader>ff', { buffer = bufnr })
end

lspconfig.gopls.setup(cfg)

local configs = require 'lspconfig/configs'

if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = { 'golangci-lint-langserver' },
      root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
      init_options = {
        command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" },
      }
    },
  }
end
lspconfig.golangci_lint_ls.setup {
  filetypes = { 'go', 'gomod' }
}

lspconfig.ts_ls.setup {}

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.yamlfmt,
  },
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    'ts_ls',
    'pyright',
    'eslint',
  },

}

local ls = require("luasnip")
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    -- ['<Tab>'] = nil,
    -- ['<S-Tab>'] = nil,
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = 'rounded',
    source = true,
    header = '',
    prefix = '',
  },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
