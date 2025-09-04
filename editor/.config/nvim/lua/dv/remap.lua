vim.g.mapleader = " "

vim.keymap.set("n", "<leader>vv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", ":set hls!<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>c", [[gg"+yG]]);

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>lua vim.lsp.buf.format()<CR>',
--   { noremap = true, silent = true, desc = 'Format buffer' })
--
-- vim.keymap.set("n", "<Leader>f", function()
--   vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
-- end, { buffer = bufnr, desc = "[lsp] format" })
--
vim.keymap.set('n', '<leader>ft', function()
  local ft = vim.bo.filetype

  if (ft == 'go') then
    vim.cmd('GoFmt')
    return
  end

  -- if (ft == 'json') then
  --   vim.cmd('Prettier')
  --   return
  -- end

  -- if (ft == 'javascript' or ft == 'typescript' or ft == 'typescriptreact') then
  --   vim.cmd([[
  --     Prettier
  --     EslintFixAll
  --   ]])
  --   -- vim.cmd("EslintFixAll")
  --   return
  -- end

  vim.lsp.buf.format {
    async = true,
    -- filter = function(client) return client.name ~= "tsserver" end
  }
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

vim.keymap.set("n", "<leader>l", ":set spell!<cr>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")

-- vim.g.jupyter_mapkeys = 0
-- vim.keymap.set("n", "<leader>jc", "<cmd>JupyterSendCell<CR>", { silent = true, buffer = true })
-- vim.keymap.set("n", "<leader>jr", "<cmd>JupyterSendRange<CR>", { silent = true, buffer = true })
-- vim.keymap.set("n", "<leader>jf", "<cmd>JupyterRunFile<CR>", { silent = true, buffer = true })
-- " Run current file
-- nnoremap <buffer> <silent> <localleader>R :JupyterRunFile<CR>
-- nnoremap <buffer> <silent> <localleader>I :PythonImportThisFile<CR>

-- " Change to directory of current file
-- nnoremap <buffer> <silent> <localleader>d :JupyterCd %:p:h<CR>

-- " Send a selection of lines
-- nnoremap <buffer> <silent> <localleader>X :JupyterSendCell<CR>
-- nnoremap <buffer> <silent> <localleader>E :JupyterSendRange<CR>
-- nmap     <buffer> <silent> <localleader>e <Plug>JupyterRunTextObj
-- vmap     <buffer> <silent> <localleader>e <Plug>JupyterRunVisual

-- " Debugging maps
-- nnoremap <buffer> <silent> <localleader>b :PythonSetBreak<CR>

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

--- db mapping
vim.keymap.set('n', '<Leader>db', function()
  require("dbee").setup()
  require("dbee").toggle()
end)

-- Copy relative path to clipboard
vim.keymap.set('n', '<Leader>cp', function()
  vim.fn.setreg('+', vim.fn.expand('%'))
  vim.notify("Relative path copied to clipboard.")
end, { desc = "Copy relative file path to clipboard" })

