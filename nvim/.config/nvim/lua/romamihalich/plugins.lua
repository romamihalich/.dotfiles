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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

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

    use 'kyazdani42/nvim-tree.lua'

    use 'ThePrimeagen/vim-be-good'

    use 'fifi2/gtd.vim'

    use 'numToStr/Comment.nvim'

    use 'tpope/vim-surround'

    use 'romainl/vim-cool'

    use 'windwp/nvim-autopairs'

    use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }

    -- Color schemes
    use 'gruvbox-community/gruvbox'
    use 'LunarVim/onedarker.nvim'
    use 'navarasu/onedark.nvim'
    use 'EdenEast/nightfox.nvim'

    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'

    -- Fuzzy finder
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind-nvim'

    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use 'rafamadriz/friendly-snippets'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Status line
    use 'hoob3rt/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'

    use 'folke/which-key.nvim'

    use 'ThePrimeagen/harpoon'

    use 'tpope/vim-fugitive'

    use 'godlygeek/tabular'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
