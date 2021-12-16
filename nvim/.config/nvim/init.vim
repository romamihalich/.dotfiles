" TODO:install and setup plugins
" https://github.com/lewis6991/gitsigns.nvim

if !exists("g:plug")
    " TODO: Donwload vim plug
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'ThePrimeagen/vim-be-good'

    Plug 'fifi2/gtd.vim'

    Plug 'numToStr/Comment.nvim'

    Plug 'tpope/vim-surround'

    Plug 'windwp/nvim-autopairs'

    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'}

    Plug 'justinmk/vim-sneak'

    " Color schemes
    Plug 'gruvbox-community/gruvbox'
    Plug 'LunarVim/onedarker.nvim'

    Plug 'puremourning/vimspector'

    " Fuzzy finder
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope.nvim'

    " LSP
    Plug 'neovim/nvim-lspconfig'
    " Plug 'kabouzeid/nvim-lspinstall'
    Plug 'williamboman/nvim-lsp-installer'

    " Autocomplete
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'onsails/lspkind-nvim'

    " Snippets
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'rafamadriz/friendly-snippets'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Dashboard
    Plug 'glepnir/dashboard-nvim'
    Plug 'ahmedkhalf/project.nvim'

    " Status line
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'folke/which-key.nvim'

    Plug 'ThePrimeagen/harpoon'

    Plug 'tpope/vim-fugitive'

call plug#end()

set tabstop=4 tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set hidden
set noerrorbells
set nowrap
set smartcase
set ignorecase
" set nohlsearch
set scrolloff=8
set noswapfile
set nobackup
set signcolumn=yes
set mouse=a
" set completeopt=menu,menuone,noselect
set timeoutlen=250

filetype plugin on
colorscheme onedarker
" highlight Normal guibg=none

" GTD
let g:gtd#dir = '~/gtd'
let g:gtd#default_action = 'inbox'
let g:gtd#map_refresh = 'r'
let g:gtd#review = [
    \ '!inbox',
    \ '!next',
    \ '!projects',
    \ '!calendar',
    \ '!waiting',
    \ '!later',
    \ '!done',
    \ '!notes',
    \ '!trash',
    \ ]

" Debug
let g:vimspector_enable_mappings = 'HUMAN'

" Colorizer
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\ ]

" Dashboard
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]
let g:dashboard_custom_section={
  \ 'a': {
      \ 'description': [' Projects'],
      \ 'command': 'Telescope projects' },
  \ 'b': {
      \ 'description': [' Dotfiles'],
      \ 'command': "lua require'telescope.builtin'.find_files{cwd = '/home/romamihalich/.config', hidden = true}" },
  \ 'c': {
      \ 'description': [' Buffers'],
      \ 'command': "Telescope buffers" },
  \ }


nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

" Key mappings
let mapleader = " "
nnoremap Y y$
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
vnoremap > >gv
vnoremap < <gv
nnoremap <silent> <leader>n :nohlsearch<CR>

tnoremap <Esc> <C-\><C-n>

" Sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

augroup kek
    autocmd!
       autocmd TermOpen * startinsert
       autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
       autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
       autocmd BufWritePost *sxhkdrc !pkill -USR1 -x sxhkd
augroup END

augroup yank_highlight
  autocmd!
  if exists('##TextYankPost')
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
  endif
augroup END
