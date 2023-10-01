-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use 'mbbill/undotree'
  use "tpope/vim-fugitive"

  -- Movement
  use "ggandor/leap.nvim"
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
  }

  -- UI
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use {
    'romgrk/barbar.nvim',
    requires = {
      "nvim-tree/nvim-web-devicons",
      'lewis6991/gitsigns.nvim'
    }
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup({
        sources = {
          "filesystem",
          "buffers",
          "git_status",
          "document_symbols",
        },
        enable_git_status = true,
        follow_current_file = {
          enabled = true
        },
        source_selector = {
          winbar = true,
          sources = {
            { source = "filesystem" },
            { source = "buffers" },
            { source = "git_status" },
            { source = "document_symbols" },
          },
        },
      })
    end
  }

  -- Visual hints
  use "lukas-reineke/indent-blankline.nvim"
  use 'Aasim-A/scrollEOF.nvim'

  -- LSP and Treesitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'nkrkv/nvim-treesitter-rescript'
  use 'nvim-treesitter/nvim-treesitter-context'

  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  -- use "ray-x/lsp_signature.nvim" -- signature as you type

  -- Seperate language stuff
  use "rescript-lang/vim-rescript"


  -- Which Key
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end
  }
end)
