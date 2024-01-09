vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use 'olimorris/onedarkpro.nvim'

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use({
    'Pocco81/auto-save.nvim',
    config = function()
      require("auto-save").setup {}
    end,
  })

  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'onsails/lspkind.nvim' },
      { 'rafamadriz/friendly-snippets' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' }
    }
  }
  use { 'L3MON4D3/LuaSnip', run = "make install_jsregexp" }

  use 'nvimtools/none-ls.nvim'
  use "akinsho/toggleterm.nvim"

  use({
    'lukas-reineke/indent-blankline.nvim',
  })

  -- use 'm4xshen/autoclose.nvim'
  use {
    'windwp/nvim-autopairs',
  }
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {}
    end
  }

  use 'terrortylor/nvim-comment'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'github/copilot.vim'
end)
