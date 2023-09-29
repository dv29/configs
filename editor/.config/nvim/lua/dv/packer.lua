-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } }
  }

  use { "nvim-telescope/telescope-file-browser.nvim" }

  use 'nanotech/jellybeans.vim'
  use 'github/copilot.vim'

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  use 'ThePrimeagen/harpoon'

  use 'tpope/vim-commentary'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  use 'jupyter-vim/jupyter-vim'
  use 'simrat39/rust-tools.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- Markdown Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use 'tomlion/vim-solidity'

  --  LSP status
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy'
  }
end)
