return {
    'ThePrimeagen/vim-be-good',
    'tpope/vim-surround',
    'romainl/vim-cool',
    'kyazdani42/nvim-web-devicons',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',

    'vimwiki/vimwiki',

    {'lyokha/vim-xkbswitch', init = function()
        vim.cmd [[
            let g:XkbSwitchEnabled = 1
            let g:XkbSwitchLib = '/home/romamihalich/software/xkb-switch/build/libxkbswitch.so'
            let g:XkbSwitchNLayout = 'us'
        ]]
    end},

    { "folke/trouble.nvim", config = function() require("trouble").setup { } end },
}
