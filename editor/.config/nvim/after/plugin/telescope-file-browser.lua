-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	":Telescope file_browser<CR>",
	{ noremap = true }
)
