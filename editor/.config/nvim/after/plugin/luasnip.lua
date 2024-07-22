-- load friendly-snippets
local snip_paths = vim.api.nvim_list_runtime_paths();
-- load custom snipptes
table.insert(snip_paths, './snipptes')

local myvimrc = vim.fn.getenv("MYVIMRC")

-- Function to strip the 'init.lua' part
local function strip_init_lua(path)
  return path:match("(.*/)")
end
local stripped_path = strip_init_lua(myvimrc)
local custom_snippet_path = stripped_path .. "snippets"

table.insert(snip_paths, custom_snippet_path)

require("luasnip.loaders.from_vscode").lazy_load({ paths = snip_paths })

