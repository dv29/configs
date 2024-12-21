-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } }
  }

  use { "nvim-telescope/telescope-file-browser.nvim" }

  use 'nanotech/jellybeans.vim'
  use 'github/copilot.vim'

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  use 'ThePrimeagen/harpoon'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use('jose-elias-alvarez/null-ls.nvim')
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

  -- -- Packer.nvim, also make sure to install nvim-lua/plenary.nvim
  -- use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua' }

  -- And optionally, you can install telescope for some search functionality
  --  "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
  --
  -- You'll also need plenary.nvim
  -- use { 'nvim-lua/plenary.nvim' }

  -- And optionally, you can install telescope for some search functionality
  --  "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]

  use { 'mfussenegger/nvim-dap', requires = { "nvim-neotest/nvim-nio" } }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  use 'leoluz/nvim-dap-go'

  use {
    "kndndrj/nvim-dbee",
    requires = {
      "MunifTanjim/nui.nvim",
    },
    run = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
  }

  use 'numToStr/Comment.nvim'

  use 'JoosepAlviste/nvim-ts-context-commentstring'
end)
