local lsp = require("lsp-zero").preset({
  suggest_lsp_servers = true,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'pyright',
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
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
  })
})


lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- local client = vim.lsp.get_client_by_id(args.data.client_id)

  -- if client.server_capabilities.inlayHintProvider then
  --   print('Enabling inlay hints')
  --   vim.lsp.buf.inlay_hint(bufnr, true)
  -- end

  -- if client.name == 'rust_analyzer' then
  --   local rt = require('rust-tools')
  --   vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, opts)
  --   vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, opts)
  -- end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  -- vim.keymap.set("n", "gd", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<leader>vh", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>rd", "<cmd>RustOpenExternalDocs<Cr>", opts)
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.skip_server_setup({ 'rust_analyzer' })

lsp.setup()

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
