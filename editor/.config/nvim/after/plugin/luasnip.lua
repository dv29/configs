-- load friendly-snippets
local snip_paths = vim.api.nvim_list_runtime_paths();
-- load custom snipptes
table.insert(snip_paths, './snippets')
require("luasnip.loaders.from_vscode").lazy_load({ paths = snip_paths })
