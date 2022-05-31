local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = require("packer.util").float,
  },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use 'lewis6991/impatient.nvim'
    use 'ThePrimeagen/vim-be-good'
    use 'tpope/vim-surround'
    use 'romainl/vim-cool'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use {'fifi2/gtd.vim', config = function() require'romamihalich.gtd' end}

    use {'windwp/nvim-autopairs', config = function() require'romamihalich.nvim-autopairs' end }

    use { 'rrethy/vim-hexokinase', run = 'make hexokinase', config = function() require'romamihalich.hexokinase' end }

    use {'kyazdani42/nvim-tree.lua', config = function() require'romamihalich.nvim-tree' end }

    use {'numToStr/Comment.nvim', config = function() require'romamihalich.Comment' end }

    -- Color schemes
    use {
        'gruvbox-community/gruvbox',
        'LunarVim/onedarker.nvim',
        'navarasu/onedark.nvim',
        'EdenEast/nightfox.nvim'
    }

    use {'mfussenegger/nvim-dap', config = function() require'romamihalich.nvim-dap' end }
    use 'rcarriga/nvim-dap-ui'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        config = function() require'romamihalich.telescope' end,
        requires = {
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-ui-select.nvim'
        }
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = function() require'romamihalich.lsp.handlers'.setup() end,
        requires = {
            'Hoffs/omnisharp-extended-lsp.nvim',
            {'williamboman/nvim-lsp-installer', config = function() require'romamihalich.lsp.nvim-lsp-installer' end }
        }
    }

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp', config = function() require'romamihalich.cmp' end,
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'onsails/lspkind-nvim',
            -- Snippets
            { 'L3MON4D3/LuaSnip', config = function () require'romamihalich.luasnip' end },
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require'romamihalich.nvim-treesitter' end,
        requires = { 'windwp/nvim-ts-autotag' }
    }

    -- Status line
    use {'hoob3rt/lualine.nvim', config = function() require'romamihalich.lualine' end }

    use {'folke/which-key.nvim', config = function() require'romamihalich.which-key' end }

    use 'ThePrimeagen/harpoon'

    use 'tpope/vim-fugitive'

    use 'godlygeek/tabular'

    use {'goolord/alpha-nvim', config = function() require'romamihalich.alpha' end }

    use {'NTBBloodbath/rest.nvim', config = function() require'romamihalich.rest-nvim' end }

    use { '/home/romamihalich/projects/csharp-nvim', config = function() require'csharp-nvim'.setup() end}

    use { "folke/trouble.nvim", config = function() require("trouble").setup { } end }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
