-- local ensure_packer = function()
--   local fn = vim.fn
--   local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
--   if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
--     vim.cmd [[packadd packer.nvim]]
--     return true
--   end
--   return false
-- end
--
-- local packer_bootstrap = ensure_packer()
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } }
  }
  -- tag = '0.1.5',

  use { 'nvim-telescope/telescope-file-browser.nvim' }

  use 'nanotech/jellybeans.vim'
  use 'github/copilot.vim'

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  use 'ThePrimeagen/harpoon'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use('nvimtools/none-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  use {
    'mrcjkb/rustaceanvim',
    -- tag = '4.26.1',   -- Recommended
    -- lazy = false, -- This plugin is already lazy
  }

  -- use({'VonHeikemen/lsp-zero.nvim', })
  -- use({'neovim/nvim-lspconfig'})
  -- use({'hrsh7th/nvim-cmp'})
  -- use({'hrsh7th/cmp-nvim-lsp'})

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'mason-org/mason.nvim' },
      { 'mason-org/mason-lspconfig.nvim' },

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
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  })

  use 'tomlion/vim-solidity'

  --  LSP status
  use { 'j-hui/fidget.nvim' }

  -- -- Packer.nvim, also make sure to install nvim-lua/plenary.nvim
  -- use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua' }

  -- And optionally, you can install telescope for some search functionality
  --  'nvim-lua/plenary.nvim', --[[ 'nvim-telescope/telescope.nvim ]]
  --
  -- You'll also need plenary.nvim
  -- use { 'nvim-lua/plenary.nvim' }

  -- And optionally, you can install telescope for some search functionality
  --  'nvim-lua/plenary.nvim', --[[ 'nvim-telescope/telescope.nvim ]

  use { 'mfussenegger/nvim-dap', requires = { 'nvim-neotest/nvim-nio' } }
  use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }

  use 'leoluz/nvim-dap-go'
  use 'MunifTanjim/nui.nvim'

  use {
    'kndndrj/nvim-dbee',
    requires = {
      'MunifTanjim/nui.nvim',
    },
    run = function()
      require('dbee').install()
    end,
    config = function()
      require("dbee").setup( --[[optional config]])
    end,
  }

  use 'numToStr/Comment.nvim'

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -- if packer_bootstrap then
  --   require('packer').sync()
  -- end
end)
